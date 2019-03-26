library(sgof)


### Name: Binomial.SGoF
### Title: Binomial SGoF multiple testing procedure
### Aliases: Binomial.SGoF print.Binomial.SGoF
### Keywords: htest Binomial.SGoF multi-testing

### ** Examples


p<-runif(387)^2  #387 independent p-values, non-uniform intersection null violated

res<-Binomial.SGoF(p)
summary(res)   #number of rejected nulls, estimated FDR
plot(res)   #adjusted p-values



