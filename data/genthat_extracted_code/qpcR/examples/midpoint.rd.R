library(qpcR)


### Name: midpoint
### Title: Calculation of the 'midpoint' region
### Aliases: midpoint
### Keywords: models nonlinear

### ** Examples

m1 <- pcrfit(reps, 1, 2, l5)
mp <- midpoint(m1) 
plot(m1)
abline(h = mp$f.mp, col = 2)
abline(v = mp$mp, col = 2)  



