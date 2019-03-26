library(insight)


### Name: find_parameters
### Title: Find names of model parameters
### Aliases: find_parameters

### ** Examples

data(mtcars)
m <- lm(mpg ~ wt + cyl + vs, data = mtcars)
find_parameters(m)



