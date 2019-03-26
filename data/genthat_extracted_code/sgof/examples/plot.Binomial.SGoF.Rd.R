library(sgof)


### Name: plot.Binomial.SGoF
### Title: Plot of a Binomial.SGoF object
### Aliases: plot.Binomial.SGoF
### Keywords: htest multi-testing Binomial.SGoF

### ** Examples


p<-runif(387)^2  #387 independent p-values, non-uniform intersection null violated

res<-Binomial.SGoF(p)
plot(res)  



