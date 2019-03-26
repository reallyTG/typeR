library(shinyjs)


### Name: visibilityFuncs
### Title: Display/hide an element
### Aliases: visibilityFuncs show showElement hide hideElement toggle
###   toggleElement

### ** Examples

if (interactive()) {
  library(shiny)

  shinyApp(
    ui = fluidPage(
      useShinyjs(),  # Set up shinyjs
      actionButton("btn", "Click me"),
      textInput("text", "Text")
    ),
    server = function(input, output) {
      observeEvent(input$btn, {
        # Change the following line for more examples
        toggle("text")
      })
    }
  )
}
## Not run: 
##D   # The shinyjs function call in the above app can be replaced by
##D   # any of the following examples to produce similar Shiny apps
##D   toggle(id = "text")
##D   delay(1000, toggle(id = "text")) # toggle in 1 second
##D   toggle("text", TRUE)
##D   toggle("text", TRUE, "fade", 2)
##D   toggle(id = "text", time = 1, anim = TRUE, animType = "slide")
##D   show("text")
##D   show(id = "text", anim = TRUE)
##D   hide("text")
##D   hide(id = "text", anim = TRUE)
## End(Not run)

## toggle can be given an optional `condition` argument, which
## determines if to show or hide the element
if (interactive()) {
  shinyApp(
    ui = fluidPage(
      useShinyjs(),
      checkboxInput("checkbox", "Show the text", TRUE),
      p(id = "element", "Watch what happens to me")
    ),
    server = function(input, output) {
      observe({
        toggle(id = "element", condition = input$checkbox)
      })
    }
  )
}



