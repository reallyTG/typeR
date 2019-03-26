library(tinsel)


### Name: decorators
### Title: Get Function Decorators or Original Function
### Aliases: decorators original

### ** Examples

source_decoratees(tinsel_example('attributes.R'))

# sourced from the 'attributes.R' example file
selector1

# get a list of decorators wrapping a function
decorators(selector1)

# get the original decoratee function of the
# decorated `selector1` function
original(selector1)




