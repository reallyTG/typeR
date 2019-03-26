library(compositions)


### Name: barplot.acomp
### Title: Bar charts of amounts
### Aliases: barplot.acomp barplot.rcomp barplot.aplus barplot.rplus
###   barplot.ccomp
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
barplot(mean(acomp(sa.lognormals[1:10,])))
barplot(mean(rcomp(sa.lognormals[1:10,])))
barplot(mean(aplus(sa.lognormals[1:10,])))
barplot(mean(rplus(sa.lognormals[1:10,])))

barplot(acomp(sa.lognormals[1:10,]))
barplot(rcomp(sa.lognormals[1:10,]))
barplot(aplus(sa.lognormals[1:10,]))
barplot(rplus(sa.lognormals[1:10,]))

barplot(acomp(sa.tnormals))



