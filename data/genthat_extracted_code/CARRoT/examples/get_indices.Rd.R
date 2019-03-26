library(CARRoT)


### Name: get_indices
### Title: Best regression
### Aliases: get_indices

### ** Examples

#creating a set of averaged out predictive powers

predsp<-matrix(NA,ncol=3,nrow=3)

predsp[1,]=runif(3,0.7,0.8)
predsp[2,]=runif(3,0.65,0.85)
predsp[3,1]=runif(1,0.4,0.5)

#running the function

get_indices(predsp,c(3,3,3),1:3,c(1,1,1))



