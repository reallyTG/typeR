library(mc2d)


### Name: mccut
### Title: Evaluates a Two-Dimensional Monte Carlo Model in a Loop.
### Aliases: mccut evalmccut print.mccut mcmodelcut
### Keywords: methods

### ** Examples

modEC3 <- mcmodelcut({

## First block:
## Evaluates all the 0, V and U nodes.
 { cook <- mcstoc(rempiricalD, type = "V", values = c(0, 1/5, 
 1/50), prob = c(0.027, 0.373, 0.6))
 serving <- mcstoc(rgamma, type = "V", shape = 3.93, rate = 0.0806)
 conc <- mcstoc(rnorm, type = "U", mean = 10, sd = 2)
 r <- mcstoc(runif, type = "U", min = 5e-04, max = 0.0015)
 }
## Second block:
## Evaluates all the VU nodes
## Leads to the mc object. 
 {
 expo <- conc * cook * serving
 dose <- mcstoc(rpois, type = "VU", lambda = expo)
 risk <- 1 - (1 - r)^dose
 res <- mc(conc, cook, serving, expo, dose, r, risk)
 }
## Third block:
## Leads to a list of statistics: summary, plot, tornado
## or any function leading to a vector (et), a list (minmax), 
## a matrix or a data.frame (summary)
 {
 list(
 sum = summary(res), 
 plot = plot(res, draw=FALSE), 
 minmax = lapply(res, range)
 )
 }
})

x <- evalmccut(modEC3, nsv = 101, nsu = 101, seed = 666)
summary(x)




