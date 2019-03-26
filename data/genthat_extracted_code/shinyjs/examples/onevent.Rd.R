library(shinyjs)


### Name: onevent
### Title: Run R code when an event is triggered on an element
### Aliases: onevent onclick onevent

### ** Examples

if (interactive()) {
  library(shiny)

  shinyApp(
    ui = fluidPage(
      useShinyjs(),  # Set up shinyjs
      p(id = "date", "Click me to see the date"),
      p(id = "coords", "Click me to see the mouse coordinates"),
      p(id = "disappear", "Move your mouse here to make the text below disappear"),
      p(id = "text", "Hello")
    ),
    server = function(input, output) {
      onclick("date", alert(date()))
      onclick("coords", function(event) { alert(event) })
      onevent("mouseenter", "disappear", hide("text"))
      onevent("mouseleave", "disappear", show("text"))
    }
  )
}
## Not run: 
##D   # The shinyjs function call in the above app can be replaced by
##D   # any of the following examples to produce similar Shiny apps
##D   onclick("disappear", toggle("text"))
##D   onclick(expr = text("date", date()), id = "date")
## End(Not run)



