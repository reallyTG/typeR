library(shinyjs)


### Name: extendShinyjs
### Title: Extend shinyjs by calling your own JavaScript functions
### Aliases: extendShinyjs

### ** Examples

## Not run: 
##D   Example 1:
##D   Change the page background to a certain colour when a button is clicked.
##D 
##D     jsCode <- "shinyjs.pageCol = function(params){$('body').css('background', params);}"
##D 
##D     shinyApp(
##D       ui = fluidPage(
##D         useShinyjs(),
##D         extendShinyjs(text = jsCode),
##D         selectInput("col", "Colour:",
##D                     c("white", "yellow", "red", "blue", "purple"))
##D       ),
##D       server = function(input, output) {
##D         observeEvent(input$col, {
##D           js$pageCol(input$col)
##D         })
##D       }
##D     )
##D 
##D     # If you do not have `V8` package installed, you will need to add another
##D     # argument to the `extendShinyjs()` function:
##D     # extendShinyjs(text = jsCode, functions = c("pageCol"))
##D 
##D   ==============
##D 
##D   Example 2:
##D   Change the background colour of an element, using "red" as default
##D 
##D     jsCode <- '
##D     shinyjs.backgroundCol = function(params) {
##D       var defaultParams = {
##D         id : null,
##D         col : "red"
##D       };
##D       params = shinyjs.getParams(params, defaultParams);
##D 
##D       var el = $("#" + params.id);
##D       el.css("background-color", params.col);
##D     }'
##D 
##D     shinyApp(
##D       ui = fluidPage(
##D         useShinyjs(),
##D         extendShinyjs(text = jsCode),
##D         p(id = "name", "My name is Dean"),
##D         p(id = "sport", "I like soccer"),
##D         selectInput("col", "Colour:",
##D                     c("white", "yellow", "red", "blue", "purple")),
##D         textInput("selector", "Element", "sport"),
##D         actionButton("btn", "Go")
##D       ),
##D       server = function(input, output) {
##D         observeEvent(input$btn, {
##D           js$backgroundCol(input$selector, input$col)
##D         })
##D       }
##D     )
##D 
##D   ==============
##D 
##D   Example 3:
##D   Create an `increment` function that increments the number inside an HTML
##D   tag (increment by 1 by default, with an optional parameter). Use a separate
##D   file instead of providing the JS code in a string.
##D 
##D   Create a JavaScript file "myfuncs.js":
##D     shinyjs.increment = function(params) {
##D       var defaultParams = {
##D         id : null,
##D         num : 1
##D       };
##D       params = shinyjs.getParams(params, defaultParams);
##D 
##D       var el = $("#" + params.id);
##D       el.text(parseInt(el.text()) + params.num);
##D     }
##D 
##D   And a shiny app that uses the custom function we just defined. Note how
##D   the arguments can be either passed as named or unnamed, and how default
##D   values are set if no value is given to a parameter.
##D 
##D       library(shiny)
##D       shinyApp(
##D         ui = fluidPage(
##D           useShinyjs(),
##D           extendShinyjs("myfuncs.js"),
##D           p(id = "number", 0),
##D           actionButton("add", "js$increment('number')"),
##D           actionButton("add5", "js$increment('number', 5)"),
##D           actionButton("add10", "js$increment(num = 10, id = 'number')")
##D         ),
##D         server = function(input, output) {
##D           observeEvent(input$add, {
##D             js$increment('number')
##D           })
##D           observeEvent(input$add5, {
##D             js$increment('number', 5)
##D           })
##D           observeEvent(input$add10, {
##D             js$increment(num = 10, id = 'number')
##D           })
##D         }
##D       )
## End(Not run)



