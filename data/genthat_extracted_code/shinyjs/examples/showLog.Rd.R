library(shinyjs)


### Name: showLog
### Title: Print any JavaScript console.log messages in the R console
### Aliases: showLog

### ** Examples

if (interactive()) {
  library(shiny)

  shinyApp(
    ui = fluidPage(
      useShinyjs(),
      textInput("text", "Type something")
    ),
    server = function(input, output) {
      showLog()
      logjs("App started")
      observe({
        logjs(paste("Length of text:", nchar(input$text)))
      })
    }
  )
}



