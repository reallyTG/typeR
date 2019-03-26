library(assertive.properties)


### Name: n_elements
### Title: Get the number of elements
### Aliases: n_elements

### ** Examples

n_elements(1:10)
n_elements(NULL)
n_elements(data.frame(x = 1:5, y = rnorm(5)))
n_elements(list(1:5, list(1:3, list(1:7))))
n_elements(var) # depends upon the length of the body



