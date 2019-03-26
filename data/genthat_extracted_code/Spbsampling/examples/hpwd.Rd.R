library(Spbsampling)


### Name: hpwd
### Title: Heuristic Product Within Distance (Spatially Balanced Sampling).
### Aliases: hpwd

### ** Examples

##Example 1
##Draw 50 samples of dimension 10 without constant probabilities
dis<-as.matrix(dist(cbind(lucas_abruzzo$x,lucas_abruzzo$y))) #distance matrix
drawn_samples<-hpwd(dis,10,50)
## No test: 
##Example 2
##Draw 100 samples of dimension 15 with constant probabilities equal to nsamp/N
#with N=population size
dis<-as.matrix(dist(cbind(lucas_abruzzo$x,lucas_abruzzo$y))) #distance matrix
vec<-rep(1,nrow(dis)) #vector of constraints
stand_dist<-stprod(dis,vec,1e-15,1000) #standardized matrix
drawn_samples<-hpwd(stand_dist,15,100)
## End(No test)



