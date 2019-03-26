library(shinyjs)


### Name: stateFuncs
### Title: Enable/disable an input element
### Aliases: stateFuncs enable disable toggleState

### ** Examples

if (interactive()) {
  library(shiny)

  shinyApp(
    ui = fluidPage(
      useShinyjs(),  # Set up shinyjs
      actionButton("btn", "Click me"),
      textInput("element", "Watch what happens to me")
    ),
    server = function(input, output) {
      observeEvent(input$btn, {
        # Change the following line for more examples
        toggleState("element")
      })
    }
  )
}
## Not run: 
##D   # The shinyjs function call in the above app can be replaced by
##D   # any of the following examples to produce similar Shiny apps
##D   toggleState(id = "element")
##D   enable("element")
##D   disable("element")
##D 
##D   # Similarly, the "element" text input can be changed to many other
##D   # input tags, such as the following examples
##D   actionButton("element", "I'm a button")
##D   fileInput("element", "Choose a file")
##D   selectInput("element", "I'm a select box", 1:10)
## End(Not run)

## toggleState can be given an optional `condition` argument, which
## determines if to enable or disable the input
if (interactive()) {
  shinyApp(
    ui = fluidPage(
      useShinyjs(),
      textInput("text", "Please type at least 3 characters"),
      actionButton("element", "Submit")
    ),
    server = function(input, output) {
      observe({
        toggleState(id = "element", condition = nchar(input$text) >= 3)
      })
    }
  )
}



