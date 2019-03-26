library(shiny)


### Name: makeReactiveBinding
### Title: Make a reactive variable
### Aliases: makeReactiveBinding

### ** Examples

## Not run: 
##D a <- 10
##D makeReactiveBinding("a")
##D b <- reactive(a * -1)
##D observe(print(b()))
##D a <- 20
## End(Not run)



