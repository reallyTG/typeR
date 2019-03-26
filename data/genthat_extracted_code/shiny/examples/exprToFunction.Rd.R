library(shiny)


### Name: exprToFunction
### Title: Convert an expression to a function
### Aliases: exprToFunction

### ** Examples

# Example of a new renderer, similar to renderText
# This is something that toolkit authors will do
renderTriple <- function(expr, env=parent.frame(), quoted=FALSE) {
  # Convert expr to a function
  func <- shiny::exprToFunction(expr, env, quoted)

  function() {
    value <- func()
    paste(rep(value, 3), collapse=", ")
  }
}


# Example of using the renderer.
# This is something that app authors will do.
values <- reactiveValues(A="text")

## Not run: 
##D # Create an output object
##D output$tripleA <- renderTriple({
##D   values$A
##D })
## End(Not run)

# At the R console, you can experiment with the renderer using isolate()
tripleA <- renderTriple({
  values$A
})

isolate(tripleA())
# "text, text, text"



