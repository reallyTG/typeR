library(lmomco)


### Name: lkhlmomco
### Title: Leimkuhler Curve of the Distributions
### Aliases: lkhlmomco
### Keywords: quantile function Leimkuhler curve lifetime/reliability
###   analysis The lmomco functions

### ** Examples

# It is easiest to think about residual life as starting at the origin, units in days.
A <- vec2par(c(0.0, 2649, 2.11), type="gov") # so set lower bounds = 0.0

"afunc" <- function(u) { return(par2qua(u,A,paracheck=FALSE)) }
f <- 0.35 # All three computations report: Ku = 0.6413727
Ku1 <- 1 - 1/cmlmomco(f=0,A) * integrate(afunc,0,1-f)$value
Ku2 <- (cmlmomco(0,A) - (1-f)*(quagov(1-f,A) - rrmlmomco(1-f,A)))/cmlmomco(0,A)
Ku3 <- lkhlmomco(f, A)



