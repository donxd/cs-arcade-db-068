/*Please add ; after each select statement*/
CREATE PROCEDURE hostnamesOrdering()
BEGIN
    SELECT
      d1.id
    , d1.hostname
    -- , d1.domain
    -- , d1.end_domain
    FROM (
        SELECT 
              id
            , hostname
            , REGEXP_SUBSTR(hostname, '[^.]+[.][^.]+$') domain
            , REGEXP_SUBSTR(hostname, '[^.]+$') end_domain
        FROM hostnames
    ) d1
    ORDER BY d1.end_domain ASC, d1.domain ASC, d1.hostname ASC
    ;
END