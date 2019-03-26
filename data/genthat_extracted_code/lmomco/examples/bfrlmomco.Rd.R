library(lmomco)


### Name: bfrlmomco
### Title: Bonferroni Curve of the Distributions
### Aliases: bfrlmomco
### Keywords: quantile function Bonferroni curve lifetime/reliability
###   analysis The lmomco functions

### ** Examples

# It is easiest to think about residual life as starting at the origin, units in days.
A <- vec2par(c(0.0, 2649, 2.11), type="gov") # so set lower bounds = 0.0

"afunc" <- function(u) { return(par2qua(u,A,paracheck=FALSE)) }
f <- 0.65 # Both computations report: 0.5517342
Bu1 <- 1/(cmlmomco(f=0,A)*f) * integrate(afunc, 0, f)$value
Bu2 <- bfrlmomco(f, A)



