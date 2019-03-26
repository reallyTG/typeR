library(ecp)


### Name: e.agglo
### Title: ENERGY AGGLOMERATIVE
### Aliases: e.agglo
### Keywords: agglomerative hierarchical

### ** Examples

set.seed(100)
mem = rep(c(1,2,3,4),times=c(10,10,10,10))
x = as.matrix(c(rnorm(10,0,1),rnorm(20,2,1),rnorm(10,-1,1)))
y = e.agglo(X=x,member=mem,alpha=1,penalty=function(cp,Xts) 0)
y$estimates


## Not run: 
##D # Multivariate spatio-temporal example
##D # You will need the following packages:
##D #	mvtnorm, combinat, and MASS
##D library(mvtnorm); library(combinat); library(MASS)
##D set.seed(2013)
##D lambda = 1500 #overall arrival rate per unit time
##D muA = c(-7,-7) ; muB = c(0,0) ; muC = c(5.5,0)
##D covA = 25*diag(2)
##D covB = matrix(c(9,0,0,1),2)
##D covC = matrix(c(9,.9,.9,9),2)
##D time.interval = matrix(c(0,1,3,4.5,1,3,4.5,7),4,2)
##D #mixing coefficents
##D mixing.coef = rbind(c(1/3,1/3,1/3),c(.2,.5,.3), c(.35,.3,.35), 
##D 	c(.2,.3,.5))
##D stppData = NULL
##D for(i in 1:4){
##D 	count = rpois(1, lambda* diff(time.interval[i,]))
##D 	Z = rmultz2(n = count, p = mixing.coef[i,])
##D 	S = rbind(rmvnorm(Z[1],muA,covA), rmvnorm(Z[2],muB,covB),
##D 		rmvnorm(Z[3],muC,covC))
##D 	X = cbind(rep(i,count), runif(n = count, time.interval[i,1],
##D 		time.interval[i,2]), S)
##D 	stppData = rbind(stppData, X[order(X[,2]),])
##D }
##D member = as.numeric(cut(stppData[,2], breaks = seq(0,7,by=1/12)))
##D output = e.agglo(X=stppData[,3:4],member=member,alpha=1,
##D 	penalty=function(cp,Xts) 0)
## End(Not run)



