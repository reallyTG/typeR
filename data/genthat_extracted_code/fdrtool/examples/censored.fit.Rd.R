library(fdrtool)


### Name: censored.fit
### Title: Fit Null Distribution To Censored Data by Maximum Likelihood
### Aliases: censored.fit fndr.cutoff
### Keywords: htest

### ** Examples

# load "fdrtool" library
library("fdrtool")

# simulate normal data
sd.true = 2.232
n = 5000
z = rnorm(n, sd=sd.true)
censored.fit(z, c(2,3,5), statistic="normal")


# simulate contaminated mixture of correlation distribution
r = rcor0(700, kappa=10)
u1 = runif(200, min=-1, max=-0.7)
u2 = runif(200, min=0.7, max=1)
rc = c(r, u1, u2)

censored.fit(r, 0.7, statistic="correlation")
censored.fit(rc, 0.7, statistic="correlation")

# pvalue example
data(pvalues)
co = fndr.cutoff(pvalues, statistic="pvalue")
co
censored.fit(pvalues, cutoff=co, statistic="pvalue")



