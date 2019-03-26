library(MNM)


### Name: mv.2way.est
### Title: Treatment Effect Estimates in the Randomized Complete Block Case
### Aliases: mv.2way.est
### Keywords: multivariate nonparametric

### ** Examples

data(beans)
est<-mv.2way.est(beans[,3:5],beans$Block,beans$Treatment,score="r",stand="i")
summary(est)



