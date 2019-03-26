library(nparcomp)


### Name: npar.t.test.paired
### Title: A 2-sample nonparametric studentized permutation test for paired
###   data
### Aliases: npar.t.test.paired
### Keywords: htest

### ** Examples


data(PGI)
a<-npar.t.test.paired(PGIscore~timepoint, data = PGI, 
               alternative = "two.sided", info=FALSE, plot.simci=FALSE)
summary(a)
plot(a)
               



