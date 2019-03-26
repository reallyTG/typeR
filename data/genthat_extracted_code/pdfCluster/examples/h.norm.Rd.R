library(pdfCluster)


### Name: h.norm
### Title: Normal optimal choice of smoothing parameter in density
###   estimation
### Aliases: h.norm
### Keywords: nonparametric smooth

### ** Examples

set.seed(123)
x <- rnorm(30)
sm.par <- h.norm(x)
pdf <- kepdf(x, bwtype= "fixed", h = sm.par)
plot(pdf, eval.points=seq(-4,4,by=.2))



