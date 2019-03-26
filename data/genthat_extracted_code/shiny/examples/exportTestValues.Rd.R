library(shiny)


### Name: exportTestValues
### Title: Register expressions for export in test mode
### Aliases: exportTestValues

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {

options(shiny.testmode = TRUE)

# This application shows the test snapshot URL; clicking on it will
# fetch the input, output, and exported values in JSON format.
shinyApp(
  ui = basicPage(
    h4("Snapshot URL: "),
    uiOutput("url"),
    h4("Current values:"),
    verbatimTextOutput("values"),
    actionButton("inc", "Increment x")
  ),

  server = function(input, output, session) {
    vals <- reactiveValues(x = 1)
    y <- reactive({ vals$x + 1 })

    observeEvent(input$inc, {
      vals$x <<- vals$x + 1
    })

    exportTestValues(
      x = vals$x,
      y = y()
    )

    output$url <- renderUI({
      url <- session$getTestSnapshotUrl(format="json")
      a(href = url, url)
    })

    output$values <- renderText({
      paste0("vals$x: ", vals$x, "\ny: ", y())
    })
  }
)
}



