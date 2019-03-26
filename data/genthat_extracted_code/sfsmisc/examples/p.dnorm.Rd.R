library(sfsmisc)


### Name: p.dnorm
### Title: Plot Parametric Density Functions
### Aliases: p.dnorm p.dchisq p.dgamma
### Keywords: hplot utilities

### ** Examples

p.dnorm()
p.dnorm(mu=1.5, add = TRUE, ms.lines = FALSE) # add to the plot above

p.dchisq(2, main= "Chi^2 Densities -- nu = 2,3,4")
p.dchisq(3, add = TRUE, col = "red")
p.dchisq(4, add = TRUE, col = "blue")

op <- par(mfrow = c(2,2), mgp = c(1.6, 0.6,0), mar = c(3,3,1,1))
for(sh in 1:4)
   p.dgamma(sh)
par(op)



