library(CUB)


### Name: chi2cub
### Title: Pearson X^2 statistic
### Aliases: chi2cub
### Keywords: htest

### ** Examples

data(univer)
m<-7
pai<-0.3
gama<-c(0.1,0.7)
ordinal<-univer$informat; W<-univer$gender;
pearson<-chi2cub(m,ordinal,W,pai,gama)
degfree<-pearson$df
statvalue<-pearson$chi2
deviance<-pearson$dev



