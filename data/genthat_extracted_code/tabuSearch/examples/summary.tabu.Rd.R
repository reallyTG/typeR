library(tabuSearch)


### Name: summary.tabu
### Title: R Based Tabu Search Summary Function
### Aliases: summary.tabu

### ** Examples

# A simple example

evaluateSimple <- function(th)return(1)
result <- tabuSearch(size = 20, iters = 100, objFunc = evaluateSimple) 

summary(result)
summary(result, verbose = TRUE)



