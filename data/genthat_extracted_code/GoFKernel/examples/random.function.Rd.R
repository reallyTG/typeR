library(GoFKernel)


### Name: random.function
### Title: Random Draw Generator
### Aliases: random.function

### ** Examples

f0 <- function(x) ifelse(x>=0 & x<=1, 2-2*x, 0)
random.function(10, f0, lower=0, upper=1, kind="density")



