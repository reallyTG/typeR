library(shinyjs)


### Name: runcode
### Title: Construct to let you run arbitrary R code live in a Shiny app
### Aliases: runcode runcodeUI runcodeServer

### ** Examples

if (interactive()) {
  library(shiny)

  shinyApp(
    ui = fluidPage(
      useShinyjs(),  # Set up shinyjs
      runcodeUI(code = "shinyjs::alert('Hello!')")
    ),
    server = function(input, output) {
      runcodeServer()
    }
  )
}



