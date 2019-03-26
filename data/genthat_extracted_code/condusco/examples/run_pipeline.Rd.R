library(condusco)


### Name: run_pipeline
### Title: Runs user-provided pipeline for each row of arguments in
###   parameters, converting any JSON strings to objects
### Aliases: run_pipeline

### ** Examples


library(whisker)

run_pipeline(
  function(params){
   query <- "SELECT result FROM {{table_prefix}}_results;"
   whisker.render(query,params)
 },
 data.frame(
   table_prefix = c('batman', 'robin')
 )
)




