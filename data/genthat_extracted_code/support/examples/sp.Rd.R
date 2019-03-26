library(support)


### Name: sp
### Title: Generating support points using difference-of-convex programming
### Aliases: sp

### ** Examples

  
  
    ## Support points on standard distributions
    
    #Generate 25 support points for the 2-d i.i.d. N(0,1) distribution
    n <- 25 #number of points
    p <- 2 #dimension
    des <- sp(n,p,std.flg=TRUE,dist.str=rep("normal",p))
    
    x1 <- seq(-3.5,3.5,length.out=100) #Plot contours
    x2 <- seq(-3.5,3.5,length.out=100)
    z <- exp(-outer(x1^2,x2^2,FUN="+")/2)
    contour.default(x=x1,y=x2,z=z,drawlabels=FALSE,nlevels=10)
    points(des$sp,pch=16,cex=1.25,col="red")
    
    #Generate 50 support points for the 2-d i.i.d. Beta(2,4) distribution
    n <- 50
    p <- 2
    dist.param <- vector("list",p)
    for (l in 1:p){
      dist.param[[l]] <- c(2,4)
    }
    des <- sp(n,p,std.flg=TRUE,dist.str=rep("beta",p),dist.param=dist.param)
    
    x1 <- seq(0,1,length.out=100) #Plot contours
    x2 <- seq(0,1,length.out=100)
    z <- matrix(NA,nrow=100,ncol=100)
    for (i in 1:100){
      for (j in 1:100){
        z[i,j] <- dbeta(x1[i],2,4) * dbeta(x2[j],2,4)
      }
    }
    contour.default(x=x1,y=x2,z=z,drawlabels=FALSE,nlevels=10 )
    points(des$sp,pch=16,cex=1.25,col="red")
    
    #Generate 100 support points for the 5-d i.i.d. Exp(1) distribution
    n <- 100
    p <- 5
    des <- sp(n,p,std.flg=TRUE,dist.str=rep("exponential",p))
    pairs(des$sp,xlim=c(0,5),ylim=c(0,5),pch=16)
    
  ## Not run: 
##D     ## Support points for big data reduction
##D     library(MHadaptive)
##D     
##D     #Use modified Franke's function as posterior
##D     franke2d <- function(xx){
##D       if ((xx[1]>1)||(xx[1]<0)||(xx[2]>1)||(xx[2]<0)){
##D         return(-Inf)
##D       }
##D       else{
##D         x1 <- xx[1]
##D         x2 <- xx[2]
##D         
##D         term1 <- 0.75 * exp(-(9*x1-2)^2/4 - (9*x2-2)^2/4)
##D         term2 <- 0.75 * exp(-(9*x1+1)^2/49 - (9*x2+1)/10)
##D         term3 <- 0.5 * exp(-(9*x1-7)^2/4 - (9*x2-3)^2/4)
##D         term4 <- -0.2 * exp(-(9*x1-4)^2 - (9*x2-7)^2)
##D         
##D         y <- term1 + term2 + term3 + term4
##D         return(2*log(y))
##D       }
##D     }
##D     
##D     #Generate MCMC samples
##D     li_func <- franke2d #Desired log-posterior
##D     ini <- c(0.5,0.5) #Initial point for MCMc
##D     NN <- 1e5 #Number of MCMC samples desired
##D     burnin <- NN/2 #Number of burn-in runs
##D     mcmc_r <- Metro_Hastings(li_func, pars=ini, prop_sigma=0.05*diag(2),
##D                    iterations=NN, burn_in=burnin)
##D     
##D     #Compute 100 support points
##D     n <- 100
##D     des <- sp(n,2,std.flg=FALSE,dist.samp=mcmc_r$trace)
##D     
##D     #Plot support points
##D     x1 <- seq(0,1,length.out=100) #contours
##D     x2 <- seq(0,1,length.out=100)
##D     z <- matrix(NA,nrow=100,ncol=100)
##D     for (i in 1:100){
##D       for (j in 1:100){
##D         z[i,j] <- franke2d(c(x1[i],x2[j]))
##D       }
##D     }
##D     contour.default(x=x1,y=x2,z=z,drawlabels=TRUE,nlevels=10 )
##D     points(des$sp,pch=16,cex=1.25,col="red")
##D 
##D   
## End(Not run)



