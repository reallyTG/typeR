library(dqshiny)


### Name: add_js
### Title: Adds a custom js function
### Aliases: add_js run_js

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    add_js(type="addValues", "function(params) {
      alert('Result is: ' + (parseInt(params[0]) + parseInt(params[1])));
    }"),
    add_js(type="myName", "function(params) {
      alert('My name is ' + params.name);
    }"),
    actionButton("btn1", "Add Values"),
    actionButton("btn2", "What's my name?")
  ),
  server = function(input, output) {
    observeEvent(input$btn1, run_js(type = "addValues", 17, 25))
    observeEvent(input$btn2, run_js(type = "myName", name = "Paul"))
  }
)

}



