library(circular)


### Name: rao.spacing.test
### Title: Rao's Spacing Test of Uniformity
### Aliases: rao.spacing.test print.rao.spacing.test
### Keywords: htest

### ** Examples

x <- circular(runif(200, 0, 2*pi))
rao.spacing.test(x)

res <- print(rao.spacing.test(x, alpha=0.1))
res$accepted

x <- rvonmises(100, circular(0), 20)
rao.spacing.test(x)



