library(shinyjs)


### Name: html
### Title: Change the HTML (or text) inside an element
### Aliases: html

### ** Examples

if (interactive()) {
  library(shiny)

  shinyApp(
    ui = fluidPage(
      useShinyjs(),  # Set up shinyjs
      actionButton("btn", "Click me"),
      p(id = "element", "Watch what happens to me")
    ),
    server = function(input, output) {
      observeEvent(input$btn, {
        # Change the following line for more examples
        html("element", paste0("The date is ", date()))
      })
    }
  )
}
## Not run: 
##D   # The shinyjs function call in the above app can be replaced by
##D   # any of the following examples to produce similar Shiny apps
##D   html("element", "Hello!")
##D   html("element", " Hello!", TRUE)
##D   html("element", "<strong>bold</strong> that was achieved with HTML")
##D   local({val <- "some text"; html("element", val)})
##D   html(id = "element", add = TRUE, html = input$btn)
## End(Not run)



