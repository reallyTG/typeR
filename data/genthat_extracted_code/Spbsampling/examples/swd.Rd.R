library(Spbsampling)


### Name: swd
### Title: Sum Within Distance (Spatially Balanced Sampling).
### Aliases: swd

### ** Examples

#Example 1
#Draw 20 samples of dimension 15 without constant probabilities
dis<-as.matrix(dist(cbind(income_emilia$x_coord,income_emilia$y_coord))) #distance matrix
nsamp<-15  #sample size
nrepl<-20  #number of samples to draw
niter<-10  #number of iterations in the algorithm
bexp<-10   #parameter \eqn{\beta}
drawn_samples<-swd(dis,niter,nsamp,nrepl,bexp)  #drawn samples
## No test: 
#Example 2
#Draw 20 samples of dimension 15 with constant probabilities equal to nsamp/N
#with N=population size
dis<-as.matrix(dist(cbind(income_emilia$x_coord,income_emilia$y_coord))) #distance matrix
nsamp<-15  #sample size
nrepl<-20  #numbers of samples to drawn
niter<-10  #numbers of iterations in the algorithm
bexp<-10  #parameter \eqn{\beta}
vec<-rep(1,nrow(dis)) #vector of constraints
stand_dist<-stsum(dis,vec,1e-15,1000) #standardized matrix
drawn_samples<-swd(stand_dist,niter,nsamp,nrepl,bexp)  #drawn samples
## End(No test)



