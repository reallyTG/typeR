library(gensvm)


### Name: coef.gensvm.grid
### Title: Get the parameter grid from a GenSVM Grid object
### Aliases: coef.gensvm.grid

### ** Examples

## No test: 
x <- iris[, -5]
y <- iris[, 5]

grid <- gensvm.grid(x, y)
pg <- coef(grid)
## End(No test)




