library(pdfCluster)


### Name: hprop2f
### Title: Sample smoothing parameters in adaptive density estimation
### Aliases: hprop2f
### Keywords: nonparametric smooth

### ** Examples

set.seed(123)
x <- rnorm(10)

sm.par <- hprop2f(x)
pdf <- kepdf(x, bwtype= "adaptive")

pdf@par$hx
sm.par

plot(pdf,eval.points=seq(-4,4,by=.2))



