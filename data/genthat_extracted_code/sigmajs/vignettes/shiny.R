## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
)
library(htmltools)
library(sigmajs)

## ---- echo=FALSE---------------------------------------------------------
div(
  class = "panel panel-danger",
  div(
    class = "panel-body",
    tags$i(class = "fa fa-warning text-danger"),
    " Set", code("kill"), "to", code("TRUE"), "in", code("sigmajs"), "or pipe", code("sg_kill"), "to your graph if you are",
    strong("not updating the Shiny graph with", code("sigmajsProxy"))
  )
)

## ---- eval = FALSE-------------------------------------------------------
#  library(shiny)
#  library(sigmajs)
#  
#  nodes <- sg_make_nodes()
#  edges <- sg_make_edges(nodes)
#  
#  ui <- fluidPage(sigmajsOutput("sg")) # bare bone UI
#  
#  server <- function(input, output){
#    output$sg <- renderSigmajs({
#      sigmajs() %>%
#        sg_nodes(nodes, id, size, color) %>%
#        sg_edges(edges, id, source, target)
#    })
#  }
#  
#  shinyApp(ui, server) # run

## ---- eval = FALSE-------------------------------------------------------
#  nodes <- sg_make_nodes()
#  edges <- sg_make_edges(nodes)
#  
#  ui <- fluidPage(
#    actionButton("start", "Trigger layout"), # add the button
#    sigmajsOutput("sg")
#  )
#  
#  server <- function(input, output){
#  
#    output$sg <- renderSigmajs({
#      sigmajs() %>%
#        sg_nodes(nodes, id, size, color) %>%
#        sg_edges(edges, id, source, target)
#    })
#  
#    observeEvent(input$start, {
#      sigmajsProxy("sg") %>% # use sigmajsProxy!
#        sg_force_start_p() # app the proxy (_p)
#    })
#  
#  }
#  
#  shinyApp(ui, server) # run

## ---- eval = FALSE-------------------------------------------------------
#  nodes <- sg_make_nodes()
#  edges <- sg_make_edges(nodes)
#  
#  ui <- fluidPage(
#    actionButton("start", "Start layout"), # start button
#    actionButton("stop", "Stop layout"), # stop button
#    sigmajsOutput("sg")
#  )
#  
#  server <- function(input, output){
#  
#    output$sg <- renderSigmajs({
#      sigmajs() %>%
#        sg_nodes(nodes, id, size, color) %>%
#        sg_edges(edges, id, source, target)
#    })
#  
#    # start layout
#    observeEvent(input$start, {
#      sigmajsProxy("sg") %>%
#        sg_force_start_p()
#    })
#  
#    # stop layout
#    observeEvent(input$stop, {
#      sigmajsProxy("sg") %>%
#        sg_force_stop_p()
#    })
#  
#  }
#  
#  shinyApp(ui, server) # run

## ---- eval = FALSE-------------------------------------------------------
#  library(shiny)
#  library(sigmajs)
#  
#  # initial nodes
#  nodes <- sg_make_nodes()
#  
#  # nodes to add on click
#  nodes2add <- sg_make_nodes()
#  nodes2add$id <- 11:20 # ids must be unique
#  
#  ui <- fluidPage(
#    actionButton("add", "Add nodes"),
#    sigmajsOutput("sg")
#  )
#  
#  server <- function(input, output){
#  
#    output$sg <- renderSigmajs({
#      sigmajs() %>%
#        sg_nodes(nodes, id, size, color)
#    })
#  
#    observeEvent(input$add, {
#      sigmajsProxy("sg") %>%
#        sg_add_nodes_p(nodes2add, id, size, color)
#    })
#  }
#  
#  shinyApp(ui, server) # run

## ---- eval=FALSE---------------------------------------------------------
#  library(shiny)
#  library(sigmajs)
#  
#  nodes <- sg_make_nodes()
#  edges <- sg_make_edges(nodes)
#  
#  ui <- fluidPage(
#    sigmajsOutput("sg"),
#    p("Click on a node"),
#    verbatimTextOutput("clicked")
#  )
#  
#  server <- function(input, output){
#    output$sg <- renderSigmajs({
#      sigmajs() %>%
#        sg_nodes(nodes, id, size, color) %>%
#        sg_edges(edges, id, source, target)
#    })
#  
#    # capture node clicked
#    output$clicked <- renderPrint({
#      input$sg_click_node
#    })
#  }
#  
#  shinyApp(ui, server) # run

## ---- eval = FALSE-------------------------------------------------------
#  nodes <- sg_make_nodes()
#  edges <- sg_make_edges(nodes)
#  
#  ui <- fluidPage(
#    sliderInput(
#      "filter",
#      "Filter nodes",
#      value = 0,
#      min = 0,
#      max = 5
#    ),
#    sigmajsOutput("sg")
#  )
#  
#  server <- function(input, output){
#  
#    output$sg <- renderSigmajs({
#      sigmajs() %>%
#        sg_nodes(nodes, id, size, color) %>%
#        sg_edges(edges, id, source, target)
#    })
#  
#    observeEvent(input$filter, {
#      sigmajsProxy("sg") %>%
#        sg_filter_gt_p(input$filterNodes, "size")
#    })
#  
#  }
#  
#  shinyApp(ui, server) # run

