library(compositions)


### Name: cor.acomp
### Title: Correlations of amounts and compositions
### Aliases: cor cor.default cor.acomp cor.rcomp cor.aplus cor.rplus
###   cor.rmult
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
meanCol(sa.lognormals)
cor(acomp(sa.lognormals5[,1:3]),acomp(sa.lognormals5[,4:5]))
cor(rcomp(sa.lognormals5[,1:3]),rcomp(sa.lognormals5[,4:5]))
cor(aplus(sa.lognormals5[,1:3]),aplus(sa.lognormals5[,4:5]))
cor(rplus(sa.lognormals5[,1:3]),rplus(sa.lognormals5[,4:5]))
cor(acomp(sa.lognormals5[,1:3]),aplus(sa.lognormals5[,4:5]))



