library(jackknifeKME)


### Name: kmweight
### Title: Compute Kaplan-Meier weights
### Aliases: kmweight

### ** Examples

#Using simdata function and considering censoring level at 50%.
data<-simdata(n = 100,lambda = 2.04) 
kmw<-kmweight(data$Y, data$delta)
kmw



