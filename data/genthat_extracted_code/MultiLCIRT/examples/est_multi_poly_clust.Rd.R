library(MultiLCIRT)


### Name: est_multi_poly_clust
### Title: Estimate multidimensional and multilevel LC IRT model for
###   dichotomous and polytomous responses
### Aliases: est_multi_poly_clust
### Keywords: maximum likelihood estimation Expectation-Maximization
###   algorithm

### ** Examples


## Not run: 
##D # generate covariate at cluster level
##D nclust = 200
##D W = matrix(round(rnorm(nclust)*2,0)/2,nclust,1)
##D la = exp(W)/(1+exp(W))
##D U = 1+1*(runif(nclust)<la)
##D clust = NULL
##D for(h in 1:nclust){
##D 	nh = round(runif(1,5,20))
##D 	clust = c(clust,h*rep(1,nh))	
##D } 
##D n = length(clust)
##D 
##D # generate covariates
##D DeV = rbind(c(1.75,1.5),c(-0.25,-1.5),c(-0.5,-1),c(0.5,1))
##D X = matrix(round(rnorm(2*n)*2,0)/2,n,2)
##D Piv = cbind(0,cbind(U[clust]==1,U[clust]==2,X)%*%DeV)
##D Piv = exp(Piv)*(1/rowSums(exp(Piv)))
##D V = rep(0,n)
##D for(i in 1:n) V[i] = which(rmultinom(1,1,Piv[i,])==1)
##D 
##D # generate responses
##D la = c(0.2,0.5,0.8)
##D Y = matrix(0,n,10)
##D for(i in 1:n) Y[i,] = runif(10)<la[V[i]]
##D 
##D # fit the model with k1=3 and k2=2 classes
##D out1 = est_multi_poly_clust(Y,kU=2,kV=3,W=W,X=X,clust=clust)
##D out2 = est_multi_poly_clust(Y,kU=2,kV=3,W=W,X=X,clust=clust,disp=TRUE,
##D                             output=TRUE)
##D out3 = est_multi_poly_clust(Y,kU=2,kV=3,W=W,X=X,clust=clust,disp=TRUE,
##D                             output=TRUE,start=2,Phi=out2$Phi,gac=out2$gac,
##D                             DeU=out2$DeU,DeV=out2$DeV)
##D # Rasch                            
##D out4 = est_multi_poly_clust(Y,kU=2,kV=3,W=W,X=X,clust=clust,link=1,
##D                             disp=TRUE,output=TRUE)
##D out5 = est_multi_poly_clust(Y,kU=2,kV=3,W=W,X=X,clust=clust,link=1,
##D                             disc=1,disp=TRUE,output=TRUE)
## End(Not run)




