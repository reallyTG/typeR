## ----setup, include=FALSE, echo=FALSE, message=FALSE---------------------
library(analysisPipelines)
library(shiny)
knitr::opts_chunk$set(
    eval = FALSE
  )

## ----data, echo=T, results='hide'----------------------------------------
#    data("iris")
#    shinyPipeline <- AnalysisPipeline()
#    shinyPipeline %>>% setLoggerDetails(target = "none")
#    shinyPipeline %>>% univarCatDistPlots(uniCol = "Species", priColor = "blue", optionalPlots = 0, storeOutput = T) ->   shinyPipeline

## ----shiny, context="server", message=FALSE, warning=FALSE, echo =TRUE, results='asis'----
#    sampled_data <- shiny::reactivePoll(intervalMillis = 2000,
#                                          session = NULL,
#                                          checkFunc = function() return(base::sample(1:100, 1)),
#                                          valueFunc = function() return(iris[sample(1:nrow(iris), 100),]))

## ------------------------------------------------------------------------
#    shiny::renderPlot(height = 400, {
#        sampled_data <- sampled_data()
#        shinyPipeline %>>% setInput(input = sampled_data) -> shinyPipeline
#        shinyPipeline %>>% generateOutput %>>% getOutputById("1")
#      })

