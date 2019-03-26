library(fossil)


### Name: aic.nest
### Title: Nestedness of samples using AIC
### Aliases: aic.nest
### Keywords: stats

### ** Examples

#for example, two different communities
a<-c(12,4,12,1,4,0,6,5,0,0,0)
b<-c(0,11,4,3,6,7,7,2,23,5,8)

#if the aic score is lower, it is the better model
aic.nest(a,b)

#from the same community
a<-c(5,6,5,6,5,6,5,6,5,2,1,1)
b<-c(2,3,2,3,2,3,2,3,2,1,0,0)
aic.nest(a,b)



