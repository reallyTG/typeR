library(shiny)


### Name: isolate
### Title: Create a non-reactive scope for an expression
### Aliases: isolate

### ** Examples

## Not run: 
##D observe({
##D   input$saveButton  # Do take a dependency on input$saveButton
##D 
##D   # isolate a simple expression
##D   data <- get(isolate(input$dataset))  # No dependency on input$dataset
##D   writeToDatabase(data)
##D })
##D 
##D observe({
##D   input$saveButton  # Do take a dependency on input$saveButton
##D 
##D   # isolate a whole block
##D   data <- isolate({
##D     a <- input$valueA   # No dependency on input$valueA or input$valueB
##D     b <- input$valueB
##D     c(a=a, b=b)
##D   })
##D   writeToDatabase(data)
##D })
##D 
##D observe({
##D   x <- 1
##D   # x outside of isolate() is affected
##D   isolate(x <- 2)
##D   print(x) # 2
##D 
##D   y <- 1
##D   # Use local() to avoid affecting calling environment
##D   isolate(local(y <- 2))
##D   print(y) # 1
##D })
##D 
## End(Not run)

# Can also use isolate to call reactive expressions from the R console
values <- reactiveValues(A=1)
fun <- reactive({ as.character(values$A) })
isolate(fun())
# "1"

# isolate also works if the reactive expression accesses values from the
# input object, like input$x



