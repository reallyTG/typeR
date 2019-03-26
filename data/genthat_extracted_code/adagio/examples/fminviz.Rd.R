library(adagio)


### Name: fminviz,flineviz
### Title: Visualize Function Minimum
### Aliases: fminviz flineviz
### Keywords: visualize

### ** Examples

## Not run: 
##D   f1 <- function(x) x[1]^2 - x[2]^2
##D   fminviz(f1, c(0, 0), nlines = 10)
##D 
##D   f2 <- function(x) (1 - x[1])^2 + 100*(x[2] - x[1]^2)^2
##D   flineviz(f2, c(0, 0), c(1, 1))
##D   
## End(Not run)



