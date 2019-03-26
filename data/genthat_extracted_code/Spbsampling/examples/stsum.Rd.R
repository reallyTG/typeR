library(Spbsampling)


### Name: stsum
### Title: Standardize a symmetric matrix (distances) to fixed row (column)
###   totals.
### Aliases: stsum

### ** Examples

dis<-as.matrix(dist(cbind(simul2$x,simul2$y))) #distance matrix
vec<-rep(1,nrow(dis)) #vector of constraints
stand_dist<-stsum(dis,vec,1e-15,1000) #standardized matrix



