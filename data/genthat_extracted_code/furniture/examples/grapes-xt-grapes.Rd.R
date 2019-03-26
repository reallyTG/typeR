library(furniture)


### Name: %xt%
### Title: Simple Crosstabs Operator
### Aliases: %xt%

### ** Examples


b = c(1,0,0,1,1,0,1,1,1,0)
x = c(1,2,3,2,3,3,1,0,0,0)
y = rnorm(10)
z = c("Yes", "No", "Yes", "No", "No", "Yes", "No", "No", "Yes", "No")

factor(x) %xt% factor(b)




