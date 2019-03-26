library(shinyjs)


### Name: messageFuncs
### Title: Show a message
### Aliases: messageFuncs alert info logjs

### ** Examples

if (interactive()) {
  library(shiny)
  shinyApp(
    ui = fluidPage(
      useShinyjs(),  # Set up shinyjs
      actionButton("btn", "Click me")
    ),
    server = function(input, output) {
      observeEvent(input$btn, {
        # Change the following line for more examples
        alert(paste0("The date is ", date()))
      })
    }
  )
}
## Not run: 
##D   # The shinyjs function call in the above app can be replaced by
##D   # any of the following examples to produce similar Shiny apps
##D   alert("Hello!")
##D   alert(text = R.Version())
##D   logjs(R.Version())
## End(Not run)



