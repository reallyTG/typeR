library(condusco)


### Name: run_pipeline_dbi
### Title: A wrapper for running pipelines with a DBI connection invocation
###   query
### Aliases: run_pipeline_dbi

### ** Examples


## Not run: 
##D library(whisker)
##D library(RSQLite)
##D 
##D con <- dbConnect(RSQLite::SQLite(), ":memory:")
##D 
##D dbWriteTable(con, "mtcars", mtcars)
##D 
##D #for each cylinder count, count the number of top 5 hps it has
##D pipeline <- function(params){
##D 
##D   query <- "SELECT
##D     {{#list}}
##D     SUM(CASE WHEN hp='{{val}}' THEN 1 ELSE 0 END )as n_hp_{{val}},
##D   {{/list}}
##D     cyl
##D     FROM mtcars
##D     GROUP BY cyl
##D   ;"
##D 
##D 
##D   dbGetQuery(
##D     con,
##D     whisker.render(query,params)
##D   )
##D }
##D 
##D 
##D #pass the top 5 most common hps as val params
##D run_pipeline_dbi(
##D   pipeline,
##D   '
##D   SELECT "[" || GROUP_CONCAT("{ ""val"": """ || hp ||  """ }") || "]" AS list
##D   FROM (
##D     SELECT
##D       CAST(hp as INTEGER) as HP,
##D       count(hp) as cnt
##D     FROM mtcars
##D     GROUP BY hp
##D     ORDER BY cnt DESC
##D     LIMIT 5
##D   )
##D   ',
##D   con
##D )
##D 
##D 
##D dbDisconnect(con)
## End(Not run)



