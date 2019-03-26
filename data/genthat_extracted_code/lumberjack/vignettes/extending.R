## ------------------------------------------------------------------------
library(R6)
trivial <- R6Class("trivial",
  public = list(
    changed = NULL
  , initialize = function(){
      self$changed <- FALSE
  }
  , add = function(meta, input, output){
    self$changed <- self$changed | !identical(input, output)
  }
  , dump = function(){
    msg <- if(self$changed) "" else "not "
    cat(sprintf("The data has %schanged\n",msg))
  }
  )
)

## ------------------------------------------------------------------------
library(lumberjack)
out <- women %L>% 
  start_log(trivial$new()) %L>%
  identity() %L>%
  dump_log(stop=TRUE)


out <- women %L>%
  start_log(trivial$new()) %L>%
  head() %L>%
  dump_log(stop=TRUE)

## ------------------------------------------------------------------------
library(methods)
trivial <- setRefClass("trivial",
  fields = list(
    changed = "logical"
  ),
  methods = list(
    initialize = function(){
      .self$changed = FALSE
    }
    , add = function(meta, input, output){
      .self$changed <- .self$changed | !identical(input,output)
    }
    , dump = function(){
      msg <- if( .self$changed ) "" else "not "
      cat(sprintf("The data has %schanged\n",msg))
    }
  )
)

## ------------------------------------------------------------------------
library(lumberjack)
out <- women %L>% 
  start_log(trivial()) %L>%
  identity() %L>%
  dump_log(stop=TRUE)


out <- women %L>%
  start_log(trivial()) %L>%
  head() %L>%
  dump_log(stop=TRUE)


