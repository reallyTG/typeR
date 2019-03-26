library(MCMCpack)


### Name: tomogplot
### Title: Tomography Plot
### Aliases: tomogplot
### Keywords: hplot

### ** Examples


r0 <- rpois(100, 500)
r1 <- rpois(100, 200)
c0 <- rpois(100, 100)
c1 <- (r0 + r1) - c0
tomogplot(r0, r1, c0, c1)




