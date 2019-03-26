library(gensvm)


### Name: print.gensvm.grid
### Title: Print the fitted GenSVMGrid model
### Aliases: print.gensvm.grid

### ** Examples

## No test: 
x <- iris[, -5]
y <- iris[, 5]

# fit a grid search and print the resulting object
grid <- gensvm.grid(x, y)
print(grid)
## End(No test)




