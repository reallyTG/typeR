library(shiny)


### Name: reactiveValuesToList
### Title: Convert a reactivevalues object to a list
### Aliases: reactiveValuesToList

### ** Examples

values <- reactiveValues(a = 1)
## Not run: 
##D reactiveValuesToList(values)
## End(Not run)

# To get the objects without taking dependencies on them, use isolate().
# isolate() can also be used when calling from outside a reactive context (e.g.
# at the console)
isolate(reactiveValuesToList(values))



