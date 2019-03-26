library(GA)


### Name: summary.gaisl-method
### Title: Summary for Islands Genetic Algorithms
### Aliases: summary,gaisl-method summary.gaisl print.summary.gaisl
### Keywords: optimize

### ** Examples

## Not run: 
##D f <- function(x)  abs(x)+cos(x)
##D GA <- gaisl(type = "real-valued", 
##D             fitness = function(x) -f(x), 
##D             lower = -20, upper = 20, run = 10,
##D             numIslands = 4)
##D out <- summary(GA)
##D print(out)
##D str(out)
## End(Not run)



