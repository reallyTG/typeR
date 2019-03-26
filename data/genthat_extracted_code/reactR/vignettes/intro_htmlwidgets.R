## ---- echo=FALSE, include=FALSE------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#  install.packages(c("shiny", "devtools", "usethis", "htmlwidgets", "reactR"))

## ------------------------------------------------------------------------
#  # Set the current working directory to your home directory. The new widget will
#  # be created in ~/sparklines
#  setwd("~")
#  # Create a directory 'sparklines' and populate it with skeletal package
#  # If run within RStudio, this will create a new RStudio session
#  usethis::create_package("sparklines")
#  # Generate skeletal reactR widget code and supporting build configuration
#  reactR::scaffoldReactWidget("sparklines", c("react-sparklines", "^1.7.0"))

## ------------------------------------------------------------------------
#  devtools::document()
#  devtools::install(quick = TRUE)

## ------------------------------------------------------------------------
#  shiny::runApp()

## ----echo=FALSE----------------------------------------------------------
#  knitr::include_graphics('./widget_app.jpg')

## ------------------------------------------------------------------------
#  sparklines <- function(message, width = NULL, height = NULL, elementId = NULL) {
#  
#    # describe a React component to send to the browser for rendering.
#    content <- htmltools::tag("div", list(message))
#  
#    # create widget
#    htmlwidgets::createWidget(
#      name = 'sparklines',
#      reactR::reactMarkup(content),
#      width = width,
#      height = height,
#      package = 'sparklines',
#      elementId = elementId
#    )
#  }

## ------------------------------------------------------------------------
#  sparklines <- function(data, ..., width = NULL, height = NULL) {
#  
#    # describe a React component to send to the browser for rendering.
#    content <- reactR::component(
#      "Sparklines",
#      list(data = data, ...)
#    )
#  
#    # create widget
#    htmlwidgets::createWidget(
#      name = 'sparklines',
#      reactR::reactMarkup(content),
#      width = width,
#      height = height,
#      package = 'sparklines'
#    )
#  }

## ------------------------------------------------------------------------
#  #' @export
#  sparklinesLine <- function(...) {
#    reactR::React$SparklinesLine(...)
#  }
#  
#  #' @export
#  sparklinesSpots <- function(...) {
#    reactR::React$SparklinesSpots(...)
#  }

## ------------------------------------------------------------------------
#  library(shiny)
#  library(sparklines)
#  
#  ui <- fluidPage(
#    titlePanel("reactR HTMLWidget Example"),
#    sparklinesOutput('myWidget')
#  )
#  
#  server <- function(input, output, session) {
#    output$myWidget <- renderSparklines({
#      sparklines(
#        data = rnorm(10),
#        sparklinesLine(color = "#56b45d"),
#        sparklinesSpots(style = list(fill = "#56b45d"))
#      )
#    })
#  }
#  
#  shinyApp(ui, server)

