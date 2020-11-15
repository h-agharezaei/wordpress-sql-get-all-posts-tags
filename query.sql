SELECT
    p.id,
    p.post_title,
    p.post_name,
    c.name,
    GROUP_CONCAT(t.`name`)
FROM wp_posts p
LEFT JOIN wp_term_relationships cr
    on (p.`id`=cr.`object_id`)
LEFT JOIN wp_term_taxonomy ct
    on (ct.`term_taxonomy_id`=cr.`term_taxonomy_id`
    and ct.`taxonomy`='category')
LEFT  JOIN wp_terms c on
    (ct.`term_id`=c.`term_id`)
LEFT JOIN wp_term_relationships tr
    on (p.`id`=tr.`object_id`)
LEFT JOIN wp_term_taxonomy tt
    on (tt.`term_taxonomy_id`=tr.`term_taxonomy_id`
    and tt.`taxonomy`='post_tag')
LEFT JOIN wp_terms t
    on (tt.`term_id`=t.`term_id`)
    
WHERE c.name IS NOT NULL    
GROUP BY p.id
