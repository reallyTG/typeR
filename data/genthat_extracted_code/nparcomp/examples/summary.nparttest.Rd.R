library(nparcomp)


### Name: summary.nparttest
### Title: Summary of 'npar.t.test'
### Aliases: summary.nparttest
### Keywords: print

### ** Examples

data(impla)
a<-npar.t.test(impla~group, data = impla, method = "t.app",
               alternative = "two.sided", 
               plot.simci=FALSE, info=FALSE)
summary(a)




