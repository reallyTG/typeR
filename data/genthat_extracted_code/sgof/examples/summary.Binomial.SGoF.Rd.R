library(sgof)


### Name: summary.Binomial.SGoF
### Title: Summary of a Binomial.SGoF object
### Aliases: summary.Binomial.SGoF
### Keywords: htest multi-testing Binomial.SGoF

### ** Examples




p<-runif(387)^2  #387 independent p-values, non-uniform intersection null violated

res<-Binomial.SGoF(p)
summary(res)   #number of rejected nulls, estimated FDR





