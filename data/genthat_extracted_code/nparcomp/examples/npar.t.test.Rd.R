library(nparcomp)


### Name: npar.t.test
### Title: The nonparametric Behrens-Fisher problem
### Aliases: npar.t.test
### Keywords: htest

### ** Examples


data(impla)
a<-npar.t.test(impla~group, data = impla, method = "t.app",
               alternative = "two.sided", info=FALSE)
summary(a)
plot(a)               
b<-npar.t.test(impla~group, data = impla, method= "permu",
               alternative = "two.sided", info=FALSE)
summary(b)
plot(b)



