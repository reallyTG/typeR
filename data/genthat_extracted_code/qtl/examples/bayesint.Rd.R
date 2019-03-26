library(qtl)


### Name: bayesint
### Title: Bayesian credible interval
### Aliases: bayesint
### Keywords: utilities

### ** Examples

data(hyper)
## Don't show: 
hyper <- subset(hyper, chr=c(1,4))
## End(Don't show)
hyper <- calc.genoprob(hyper, step=0.5)
out <- scanone(hyper, method="hk")
bayesint(out, chr=1)
bayesint(out, chr=4)
bayesint(out, chr=4, prob=0.99)
bayesint(out, chr=4, expandtomarkers=TRUE)



