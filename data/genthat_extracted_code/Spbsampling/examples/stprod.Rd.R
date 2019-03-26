library(Spbsampling)


### Name: stprod
### Title: Standardize a symmetric matrix (distances) to fixed row (column)
###   products.
### Aliases: stprod

### ** Examples

dis<-as.matrix(dist(cbind(simul1$x,simul1$y))) #distance matrix
vec<-rep(1,nrow(dis)) #vector of constraints
stand_dist<-stsum(dis,vec,1e-15,1000) #standardized matrix



