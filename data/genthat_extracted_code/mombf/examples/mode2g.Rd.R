library(mombf)


### Name: mode2g
### Title: Moment and inverse moment prior elicitation.
### Aliases: mode2g g2mode priorp2g
### Keywords: distribution htest

### ** Examples

#find g value giving a prior mode for (theta/(sigma*n*Sigma))^2 at 0.2^2
data(hald)
lm1 <- lm(hald[, 1] ~ hald[, 2] + hald[, 3] + hald[, 4] + hald[, 5])
prior.mode <- .2
gmom <- mode2g(prior.mode^2, prior='normalMom')
gtmom <- mode2g(prior.mode^2, prior='tMom', nu=3)
gimom <- mode2g(prior.mode^2, prior='iMom')
gmom
gimom

#find g value giving 0.05 probability to interval (-.2,.2)
priorp <- .05; q <- .2
gmom <- priorp2g(priorp=priorp, q=q, prior='normalMom')
gimom <- priorp2g(priorp=priorp, q=q, prior='iMom')
gmom
gimom



