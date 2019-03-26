## ------------------------------------------------------------------------
library(whisker)
library(DBI)
library(condusco)

## ------------------------------------------------------------------------
con <- dbConnect(RSQLite::SQLite(), ":memory:")

pipeline <- function(params){

  query <-"
    SELECT count(*) as n_hits 
    FROM user_hits 
    WHERE date(date_time) BETWEEN date('{{{date_low}}}') AND date('{{{date_high}}}')
  ;"

  whisker.render(query,params)

}

run_pipeline_dbi(pipeline,
  "SELECT date('now', '-5 days') as date_low, date('now') as date_high",
  con
)

dbDisconnect(con)


## ------------------------------------------------------------------------
con <- dbConnect(RSQLite::SQLite(), ":memory:")

pipeline <- function(params){

  query <- "SELECT {{{value}}} as dollars_won,
    {{#list}}
    '{{name1}}' as {{name2}},
    {{/list}}
    '{{{field}}}' as field
  ;"

  whisker.render(query,params)

}


run_pipeline_dbi(
  pipeline,
  "SELECT value,
    field,
    list
  FROM (
    SELECT 1000 as value,
      'word' as field,
      '[{\"name1\":\"foo1\", \"name2\":\"bar1\"},{\"name1\":\"foo2\", \"name2\":\"bar2\"}]' as list
  )
  UNION ALL
  SELECT 2000 as value,
    'word' as field,
    '[{\"name1\":\"foo1\", \"name2\":\"bar1\"},{\"name1\":\"foo2\", \"name2\":\"bar2\"}]' as list
  ",
  con
)


dbDisconnect(con)


## ------------------------------------------------------------------------
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)

#for each cylinder count, count the number of top 5 hps it has
pipeline <- function(params){
  
  query <- "SELECT
    {{#list}}
    SUM(CASE WHEN hp='{{val}}' THEN 1 ELSE 0 END )as n_hp_{{val}},
  {{/list}}
    cyl
    FROM mtcars
    GROUP BY cyl
  ;"


  dbGetQuery(
    con,
    whisker.render(query,params)
  )
}


#pass the top 5 most common hps as val params
run_pipeline_dbi(
  pipeline,
  '
  SELECT "[" || GROUP_CONCAT("{ ""val"": """ || hp ||  """ }") || "]" AS list
  FROM (
    SELECT 
      CAST(hp as INTEGER) as HP,
      count(hp) as cnt
    FROM mtcars 
    GROUP BY hp
    ORDER BY cnt DESC
    LIMIT 5
  )
  ',
  con
)


dbDisconnect(con)


