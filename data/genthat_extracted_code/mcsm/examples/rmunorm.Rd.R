library(mcsm)


### Name: rmunorm
### Title: Random generator for the multivariate normal distribution
### Aliases: rmunorm
### Keywords: distribution

### ** Examples

test=NULL
for (t in 1:10^4) test=rbind(test,rmunorm(rep(1,2),matrix(c(1,-2,-2,10),ncol=2)))
cor(test[,1],test[,2])*sqrt(10)  # should be close to -2



