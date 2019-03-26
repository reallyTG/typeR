library(shinyjs)


### Name: classFuncs
### Title: Add/remove CSS class
### Aliases: classFuncs addClass addCssClass removeClass removeCssClass
###   toggleClass toggleCssClass

### ** Examples

if (interactive()) {
  library(shiny)

  shinyApp(
    ui = fluidPage(
      useShinyjs(),  # Set up shinyjs
      # Add a CSS class for red text colour
      inlineCSS(list(.red = "background: red")),
      actionButton("btn", "Click me"),
      p(id = "element", "Watch what happens to me")
    ),
    server = function(input, output) {
      observeEvent(input$btn, {
        # Change the following line for more examples
        toggleClass("element", "red")
      })
    }
  )
}
## Not run: 
##D   # The shinyjs function call in the above app can be replaced by
##D   # any of the following examples to produce similar Shiny apps
##D   toggleClass(class = "red", id = "element")
##D   addClass("element", "red")
##D   removeClass("element", "red")
## End(Not run)

## toggleClass can be given an optional `condition` argument, which
## determines if to add or remove the class
if (interactive()) {
  shinyApp(
    ui = fluidPage(
      useShinyjs(),
      inlineCSS(list(.red = "background: red")),
      checkboxInput("checkbox", "Make it red"),
      p(id = "element", "Watch what happens to me")
    ),
    server = function(input, output) {
      observe({
        toggleClass(id = "element", class = "red",
                    condition = input$checkbox)
      })
    }
  )
}



