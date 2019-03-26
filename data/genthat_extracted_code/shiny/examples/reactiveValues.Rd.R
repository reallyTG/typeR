library(shiny)


### Name: reactiveValues
### Title: Create an object for storing reactive values
### Aliases: reactiveValues

### ** Examples

# Create the object with no values
values <- reactiveValues()

# Assign values to 'a' and 'b'
values$a <- 3
values[['b']] <- 4

## Not run: 
##D # From within a reactive context, you can access values with:
##D values$a
##D values[['a']]
## End(Not run)

# If not in a reactive context (e.g., at the console), you can use isolate()
# to retrieve the value:
isolate(values$a)
isolate(values[['a']])

# Set values upon creation
values <- reactiveValues(a = 1, b = 2)
isolate(values$a)




