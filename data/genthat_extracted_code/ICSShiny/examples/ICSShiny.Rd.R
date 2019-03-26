library(ICSShiny)


### Name: ICSShiny
### Title: Invariant Coordinate Selection With a Shiny App
### Aliases: ICSShiny
### Keywords: multivariate

### ** Examples

if(interactive()){
library(ICSShiny)
# ICS with ICSShiny:
res.shiny <- ICSShiny(iris)

# Close the session by clicking on the button or closing the navigator's tab
# ICS on a result of an ICSshiny object
ICSShiny(res.shiny)

# ICS with ICSShiny and different parameters
res.shiny <- ICSShiny(iris, S1 = MCD, S1args=list(alpha=0.7), seed = 7587)

# ICS with ICSShiny with parallelization of computations and seed
res.shiny <- ICSShiny(iris, iseed = 1234, ncores = 2)
}



