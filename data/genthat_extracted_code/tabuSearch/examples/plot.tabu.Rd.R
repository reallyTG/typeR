library(tabuSearch)


### Name: plot.tabu
### Title: R Based Tabu Search Plot Function
### Aliases: plot.tabu

### ** Examples

# A simple example

evaluateSimple <- function(th)return(1)
result <- tabuSearch(size = 20, iters = 100, objFunc = evaluateSimple) 

plot(result)
plot(result, "tracePlot")




