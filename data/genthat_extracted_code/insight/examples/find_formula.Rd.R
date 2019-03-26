library(insight)


### Name: find_formula
### Title: Find model formula
### Aliases: find_formula

### ** Examples

data(mtcars)
m <- lm(mpg ~ wt + cyl + vs, data = mtcars)
find_formula(m)



