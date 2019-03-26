library(condmixt)


### Name: hillest
### Title: Hill Estimator
### Aliases: hillest

### ** Examples

r<-rhpareto(5000,0.2,-50,1,trunc=TRUE)  # tail index is equal to 0.2
 # Hill estimator of the tail index with the 100 largest observations
hillest(r,10)



