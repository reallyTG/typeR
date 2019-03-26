## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  library(shiny)
#  library(processanimateR)
#  library(eventdataR)
#  library(jsonlite)
#  
#  shinyAnimation <- function(eventlog, min.time = 30, max.time = 600, default.time = 60) {
#  
#    # Define Shiny Module
#    animationUI <- function(id, title) {
#      ns <- NS(id)
#      tagList(
#        h2(title),
#        processanimaterOutput(ns("process")),
#        h4("Selected cases"),
#        textOutput(ns("token_selection")),
#        h4("Selected activities"),
#        textOutput(ns("activity_selection")),
#        h4("Current time"),
#        textOutput(ns("activity_time"))
#      )
#    }
#  
#    animation <- function(input, output, session, ...) {
#  
#      output$token_selection <- renderText({
#        if (is.null(input$process_tokens)) {
#          "None"
#        } else {
#          paste0(input$process_tokens, collapse = ",")
#        }
#      })
#  
#      output$activity_selection <- renderText({
#        if (is.null(input$process_activities)) {
#          "None"
#        } else {
#          activities <- jsonlite::fromJSON(input$process_activities)
#          paste0("(", activities$id, ",", activities$activity, ")", collapse = ",")
#        }
#      })
#  
#      output$activity_time <- renderText({
#        if (is.null(input$process_time)) {
#          "0"
#        } else {
#          input$process_time
#        }
#      })
#  
#      output$process <- renderProcessanimater(expr = {
#        animate_process(eventlog, ...)
#      })
#  
#    }
#  
#    ui <- fluidPage(
#      animationUI("module1", "Relative"),
#      animationUI("module2", "Absolute")
#    )
#  
#    # Two animations
#    server <- function(input, output, session) {
#      callModule(animation, "module1", mode = "relative")
#      callModule(animation, "module2")
#    }
#  
#    shinyApp(ui, server, options = list(height = 500))
#  
#  }
#  
#  shinyAnimation(patients)

