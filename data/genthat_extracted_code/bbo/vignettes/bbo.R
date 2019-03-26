### R code from vignette source 'bbo.Rnw'

###################################################
### code chunk number 1: bbo
###################################################
library(bbo)
Rosenbrock <- function(x){
          x1 <- x[1]
          x2 <- x[2]
          return(  100 * (x2 - x1 * x1)^2 + (1 - x1)^2 )
        }
output.of.bbo <- bbo(Rosenbrock, -1, 2, 
                     control = bbo.control(pMutate = 0.4, numVar = 2, 
                                           popSize = 50, KEEP = 10, maxGen = 10))



###################################################
### code chunk number 2: bbo-summary
###################################################
output.of.bbo <- bbo(Rosenbrock, -1, 2, 
                     control = bbo.control(pMutate = 0.4, numVar = 2, 
                     			   popSize = 50, KEEP = 10, maxGen = 10))
bbo:::summary.bbo(output.of.bbo)


###################################################
### code chunk number 3: plot-bbo
###################################################
bbo:::plot.bbo(output.of.bbo, plot.type = c("itersBestValue"))


