library(indicspecies)


### Name: nichevar
### Title: Resource niche metrics for a single niche
### Aliases: nichevar nichecentroid nichepref

### ** Examples

# Loads example data
data(birds)

# The niche metrics using distances among resources and assuming equal availability of resources
nichepref(birdsbreed, D = resourceD) 
nichevar(birdsbreed, D = resourceD) 
nichecentroid(birdsbreed, D = resourceD) 

# The niche metrics using distances among resources and computes 
# 95 percent confidence intervals
nichepref(birdsbreed, D = resourceD, mode="multiple", 
Np = rowSums(birdsbreed), Nq = 100) 
nichevar(birdsbreed, D = resourceD, mode="multiple", 
Np = rowSums(birdsbreed), Nq = 100) 
nichecentroid(birdsbreed, D = resourceD, mode="multiple", 
Np = rowSums(birdsbreed), Nq = 100) 

# Same computations with different resource availability
nichepref(birdsbreed, D = resourceD, 
q = c(0.18, 0.24, 0.22, 0.21, 0.15), mode="multiple")
nichevar(birdsbreed, D = resourceD, 
q = c(0.18, 0.24, 0.22, 0.21, 0.15), mode="multiple")
nichecentroid(birdsbreed, D = resourceD, 
q = c(0.18, 0.24, 0.22, 0.21, 0.15), mode="multiple")

# The niche metrics using distances among resources and 
# computes 95 percent confidence intervals
nichepref(birdsbreed, D = resourceD, 
q = c(0.18, 0.24, 0.22, 0.21, 0.15), mode="multiple", Np = rowSums(birdsbreed), Nq = 100)
nichevar(birdsbreed, D = resourceD, 
q = c(0.18, 0.24, 0.22, 0.21, 0.15), mode="multiple", Np = rowSums(birdsbreed), Nq = 100)
nichecentroid(birdsbreed, D = resourceD, 
q = c(0.18, 0.24, 0.22, 0.21, 0.15), mode="multiple",  Np = rowSums(birdsbreed), Nq = 100)

# The following example defines a function to calculate the area of the niche
# It requires package 'rgeos'
library(rgeos)
nichearea <- function (P, D = NULL, axes=c(1,2)) {
    if (is.null(D)) 
       D <- as.dist((matrix(1, ncol(P), ncol(P)) - diag(rep(1, ncol(P)))))
    cmd = cmdscale(D,eig=TRUE,k= ncol(P)-1)
    X = cmd$points
    V <- data.frame(Area=rep(0, nrow(P)))
    for (i in 1:nrow(P)) {
    	  pi = as.numeric(P[i,])
        if (is.na(sum(pi))) V[i, ] <- NA
        else if (sum(pi) < 1e-16) V[i, ] <- 0
        else if (sum(pi>0)==1) V[i,]<-0
   	   	else {
   	   		a =X[pi>0,axes]
	   	   	V[i,]=area.poly(as(a[chull(a),],"gpc.poly"))
   	   	}        	
    }
    return(V)
}
nichearea(birdsbreed, D = resourceD)



