library(sgof)


### Name: SGoF
### Title: Conservative SGoF multiple testing procedure
### Aliases: SGoF print.SGoF
### Keywords: htest multi-testing SGoF

### ** Examples


p<-runif(387)^2  #387 independent p-values, non-uniform intersection null violated

res<-SGoF(p)
summary(res)   #number of rejected nulls, estimated FDR
plot(res)   #adjusted p-values



