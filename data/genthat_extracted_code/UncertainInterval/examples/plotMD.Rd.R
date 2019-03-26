library(UncertainInterval)


### Name: plotMD
### Title: Function to plot the mixed densities of distributions of
###   individuals with (1) and without (0) the targeted condition.
### Aliases: plotMD

### ** Examples

# A test of intermediate quality
set.seed(1)
ref=c(rep(0,500), rep(1,500))
test=c(rnorm(500,0,1), rnorm(500,1,1.2))
plotMD(ref, test)
ua = ui.nonpar(ref, test) # with warning message!
# Add lines to indicate Uncertain Interval
abline(v=ua[1:2])
select=(test <= ua[2] & test >= ua[1])
# plot the mixed densities for the Uncertain Interval
plotMD(ref[select], test[select])
plotMD(ref[select], test[select], colspace='gray')
plotMD(ref[select], test[select], colspace='BW')

# An ordinal test
norm     = rep(1:5, times=c(33,6,6,11,2))
abnorm   = rep(1:5, times=c(3,2,2,11,33))
testres  = c(abnorm,norm)
truestat = c(rep(1,length(abnorm)), rep(0,length(norm)))
plotMD(ref=truestat, test=testres, model='ordinal')

# ordinal test: weak test
set.seed(2)
nobs=1000
Z0 <- rnorm(nobs, mean=0)
b0=seq(-5, 5, length.out=31) # range sufficient to cover both z0 and z1
f0=cut(Z0, breaks = b0, labels = c(1:30))
x0=as.numeric(levels(f0))[f0]
Z1 <- rnorm(nobs, mean=.5) # very weak test, not recommended for practical use
f1=cut(Z1, breaks = b0, labels = c(1:30))
x1=as.numeric(levels(f1))[f1]
test=c(x0, x1)
ref =c(rep(0, length(x0)), rep(1, length(x1)))
(pr=prop.table(table(ref, test)))
breaks=c(min(test)-.5, seq(min(test), max(test), by=1)+.5)
plotMD(ref, test, model='ordinal')
# when model = 'binormal' or 'kernel', default breaks do not work well for
# ordinal data, and have to be set by hand
plotMD(ref, test, breaks=c(min(test)-.5, seq(min(test), max(test), by=1)+.5),
       model='binormal')
plotMD(ref, test, breaks=c(min(test)-.5, seq(min(test), max(test), by=1)+.5),
       model='kernel')



