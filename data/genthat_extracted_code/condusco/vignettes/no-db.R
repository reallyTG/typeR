## ------------------------------------------------------------------------
library(whisker)
library(condusco)

## ------------------------------------------------------------------------

run_pipeline(
  #the pipeline
  function(params){
    query <- "SELECT result FROM {{table_prefix}}_results;"
    whisker.render(query,params)
  },
  #the swap
  data.frame(
    table_prefix = c('batman', 'robin')
  )
)



