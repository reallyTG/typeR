library(qpcR)


### Name: takeoff
### Title: Calculation of the qPCR takeoff point
### Aliases: takeoff
### Keywords: models nonlinear

### ** Examples

m1 <- pcrfit(reps, 1, 2, l5)
res1 <- takeoff(m1) 
plot(m1)
abline(v = res1$top, col = 2)
abline(h = res1$f.top, col = 2)  



