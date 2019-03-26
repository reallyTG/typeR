library(sgof)


### Name: summary.SGoF
### Title: Summary of a SGoF object
### Aliases: summary.SGoF
### Keywords: htest multi-testing SGoF

### ** Examples


p<-runif(387)^2  #387 independent p-values, non-uniform intersection null violated

res<-SGoF(p)
summary(res)   #number of rejected nulls, estimated FDR





