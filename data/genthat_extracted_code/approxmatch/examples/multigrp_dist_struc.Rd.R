library(approxmatch)


### Name: multigrp_dist_struc
### Title: Construct the distance structure for the multiple groups.
### Aliases: multigrp_dist_struc
### Keywords: distance structure

### ** Examples

	data(Dodgeram)
	## Don't show: 
	Dodgeram <- Dodgeram[sample(rownames(Dodgeram), 1000),] 
## End(Don't show)
	# Example distance structure
	components <- list(prop = c("AGE", "SEX.2", "FR.pass", "REST_USE1", "ROLLOVER1",
	            "IMPACT3", "SP_LIMIT", "DR_DRINK", "FIRE_EXP1.1"), 
	            mahal = c("SEX.2", "AGE", "SP_LIMIT", "DR_DRINK"), 				
	            mahal = c("IMPACT3", "REST_USE1"))
	wgts <- c(5, 8, 20)
	
	distmat <- multigrp_dist_struc(Dodgeram, grouplabel = c("NOSAB", "optSAB", "WITHSABS"), 
	                                   components, wgts)
	
	
## An example function for argument detail.

smahal <-  function(z,X){
        X<-as.matrix(X)
		n<-dim(X)[1]
		rownames(X)<-1:n
		k<-dim(X)[2]
		m<-sum(z)
		for (j in 1:k) X[,j]<-rank(X[,j])
		cv<-cov(X)
		vuntied<-var(1:n)
		rat<-sqrt(vuntied/diag(cv))
		cv<-diag(rat)
		out<-matrix(NA,m,n-m)
		Xc<-X[z==0,,drop=FALSE]
		Xt<-X[z==1,,drop=FALSE]
		rownames(out)<-rownames(X)[z==1]
		colnames(out)<-rownames(X)[z==0]
		#library(MASS)
		icov<-ginv(cv)
		for (i in 1:m) 
			out[i,]<-mahalanobis(Xc,Xt[i,],icov,inverted=T)
		sqrt(out)
	}



