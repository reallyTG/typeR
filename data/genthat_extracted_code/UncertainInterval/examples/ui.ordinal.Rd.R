library(UncertainInterval)


### Name: ui.ordinal
### Title: Function to calculate possible uncertain intervals of ordinal
###   test results of individuals with (1) and without (0) the targeted
###   condition.
### Aliases: ui.ordinal

### ** Examples

# A short test with 5 ordinal values
test0     = rep(1:5, times=c(165,14,16,55, 10)) # test results norm group
test1     = rep(1:5, times=c( 15,11,13,55,164)) # test results of patients
ref = c(rep(0, length(test0)), rep(1, length(test1)))
test = c(test0, test1)
table(ref, test)
plotMD(ref, test, model='ordinal') # visual inspection
ui.ordinal(ref, test, select.max='All')
# Same solution, but other layout of the results:
ui.ordinal(ref, test, select.max=c('MCI.Sp+MCI.Se', 'MCI.C', 'MCI.Acc',
                                   'MCI.Se', 'MCI.Sp', 'MCI.n'))
# forcing the Youden threshold as intersection gives the same best result.
# However, the estimates for ui.Se, ui.Sp and ui.Acc differ:
ui.ordinal(ref, test, intersection='Youden', select.max='All')

nobs=1000
set.seed(6)
Z0 <- rnorm(nobs, mean=0)
b0=seq(-5, 8, length.out=31)
f0=cut(Z0, breaks = b0, labels = c(1:30))
x0=as.numeric(levels(f0))[f0]
Z1 <- rnorm(nobs, mean=1, sd=1.5)
f1=cut(Z1, breaks = b0, labels = c(1:30))
x1=as.numeric(levels(f1))[f1]
ref=c(rep(0,nobs), rep(1,nobs))
test=c(x0,x1)
plotMD(ref, test, model='ordinal') # looks like binormal
# looks less binormal, but in fact it is a useful approximation:
plotMD(ref, test, model='binormal')
ui.ordinal(ref, test)
ui.binormal(ref, test) # compare application of the bi-normal model



