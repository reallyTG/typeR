library(POCRE)


### Name: pocre
### Title: Penalized Orthogonal-Components Regression (POCRE)
### Aliases: pocre

### ** Examples

data(simdata)
xx <- simdata[,-1]
yy <- simdata[,1]

#pres <- pocre(yy,xx,lambda=0.9)
pres <- pocre(yy,xx)   # lambda=1 by default



