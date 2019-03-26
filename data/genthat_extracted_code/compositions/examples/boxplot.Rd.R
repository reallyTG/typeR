library(compositions)


### Name: boxplot
### Title: Displaying compositions and amounts with box-plots
### Aliases: boxplot.acomp boxplot.rcomp boxplot.rplus boxplot.aplus
###   vp.boxplot vp.logboxplot
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
boxplot(acomp(sa.lognormals))
boxplot(rcomp(sa.lognormals))
boxplot(aplus(sa.lognormals))
boxplot(rplus(sa.lognormals))
# And now with missing!!!
boxplot(acomp(sa.tnormals))




