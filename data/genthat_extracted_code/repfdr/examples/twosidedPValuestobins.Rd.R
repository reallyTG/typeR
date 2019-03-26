library(repfdr)


### Name: twosided.PValues.tobins
### Title: Binning of two sided P-Values and estimation of the
###   probabilities in each bin for the null and non-null states.
### Aliases: twosided.PValues.tobins

### ** Examples


# we generate a dataset with p=10000 pvalues for two studies,
# p1=300 of which are non null:
set.seed(1)
p = 10000
p1 = 300
z1 = (rnorm(p))
z2 = (rnorm(p))
temp = rnorm(p1, 3.5,0.5)
z1[1:p1] = temp + rnorm(p1,0,0.2)
z2[1:p1] = temp + rnorm(p1,0,0.2)

zmat.example = cbind(z1,z2)
pmat.example = 1-(pnorm(abs(zmat.example)) - pnorm(-1*abs(zmat.example)))

twosided.pval.res = twosided.PValues.tobins(pmat.example,
                                            plot.diagnostics = TRUE)

twosided.pval.res$proportions




