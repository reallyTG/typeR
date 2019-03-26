library(mpoly)


### Name: vars
### Title: Determine the variables in a mpoly object.
### Aliases: vars

### ** Examples

list <- list(
  c(x = 5, coef = 2), 
  c(y = 2, coef = -3), 
  c(x = 1, y = 3, coef = 1)
)
p <- mpoly(list)
vars(p)



