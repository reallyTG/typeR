library(Spbsampling)


### Name: pwd
### Title: Product Within Distance (Spatially Balanced Sampling).
### Aliases: pwd

### ** Examples

#Example 1
#Draw 20 samples of dimension 15 without constant probabilities
dis<-as.matrix(dist(cbind(lucas_abruzzo$x,lucas_abruzzo$y))) #distance matrix
nsamp<-15  #sample size
nrepl<-20  #number of samples to draw
niter<-10  #number of iterations in the algorithm
drawn_samples<-pwd(dis,niter,nsamp,nrepl)  #drawn samples
## No test: 
#Example 2
#Draw 20 samples of dimension 15 with constant probabilities equal to nsamp/N
#with N=population size
dis<-as.matrix(dist(cbind(lucas_abruzzo$x,lucas_abruzzo$y))) #distance matrix
nsamp<-15  #sample size
nrepl<-20  #number of samples to draw
niter<-10  #number of iterations in the algorithm
vec<-rep(1,nrow(dis)) #vector of constraints
stand_dist<-stprod(dis,vec,1e-15,1000) #standardized matrix
drawn_samples<-pwd(stand_dist,niter,nsamp,nrepl)  #drawn samples
## End(No test)



