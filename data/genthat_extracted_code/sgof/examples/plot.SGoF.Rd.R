library(sgof)


### Name: plot.SGoF
### Title: Plot of a SGoF object
### Aliases: plot.SGoF
### Keywords: htest multi-testing SGoF

### ** Examples


p<-runif(387)^2  #387 independent p-values, non-uniform intersection null violated

res<-SGoF(p)
plot(res)  



