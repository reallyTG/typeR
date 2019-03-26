library(jackknifeKME)


### Name: kmweight.corr
### Title: Compute corrected Kaplan-Meier weights for jackknifing
### Aliases: kmweight.corr

### ** Examples

#Using simdata function. Censoring level is 50%.
data1<-simdata(n = 100,lambda = 2.04) 
kmwc<-kmweight.corr(data1$Y, data1$delta)
kmwc



