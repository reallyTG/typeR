library(compositions)


### Name: princomp.rmult
### Title: Principal component analysis for real data
### Aliases: princomp.rmult
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
pc <- princomp(rmult(sa.lognormals5))
pc
summary(pc)
plot(pc) 
screeplot(pc)
screeplot(pc,type="l")
biplot(pc)
biplot(pc,choice=c(1,3))
loadings(pc)
plot(loadings(pc))
pc$sdev^2
cov(predict(pc,sa.lognormals5))



