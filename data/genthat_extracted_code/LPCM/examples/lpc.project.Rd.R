library(LPCM)


### Name: lpc.project
### Title: Projection onto LPC
### Aliases: lpc.project
### Keywords: multivariate

### ** Examples

data(gvessel)
gvessel.lpc <- lpc(gvessel[,c(2,4,5)], scaled=TRUE,   h=0.11,  x0=c(35, 1870, 6.3))
lpc.project(gvessel.lpc, newdata=data.frame(salg=35,dephtg= 2000,oxyg=6))



