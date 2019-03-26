library(unfoldr)


### Name: em.saltykov
### Title: Expectation Maximization (EM) algorithm
### Aliases: em.saltykov

### ** Examples

## Not run: 
##D ## Comment: Simulate a Poisson sphere system,
##D ## 			intersect, discretize and display results
##D 
##D library(unfoldr)
##D library(rgl)
##D library(plotrix)
##D 
##D spheres <- function(spheres, box=NULL, draw.box=FALSE, draw.axis=FALSE, ...) {
##D 	xyz <- apply(sapply(spheres, "[[", "center"),1,function(x) x)
##D 	sizes <- unlist(lapply(spheres,function(x) x$r))
##D 	spheres3d(xyz,radius=sizes,...)
##D 	
##D 	if(draw.axis) {
##D 		axes3d(c('x','y','z'), pos=c(1,1,1), tick=FALSE)
##D 		#title3d('','','x','y','z')		
##D 	}
##D 	axes3d(edges = "bbox",labels=TRUE,tick=FALSE,box=TRUE,nticks=0,
##D 			expand=1.0,xlen=0,xunit=0,ylen=0,yunit=0,zlen=0,zunit=0)
##D 	
##D 	if(draw.box) {
##D 		x <- box$xrange[2]
##D 		y <- box$yrange[2]
##D 		z <- box$zrange[2]	
##D 		c3d.origin <- rgl::translate3d(rgl::scale3d(rgl::cube3d(col="gray", alpha=0.1),
##D 						x/2,y/2,z/2),x/2,y/2,z/2)
##D 		rgl::shade3d(c3d.origin)
##D 	}
##D 	
##D }
##D 
##D col <- c("#0000FF","#00FF00","#FF0000","#FF00FF","#FFFF00","#00FFFF") 
##D 
##D #################################################################
##D ## `beta` distribution for radii
##D #################################################################
##D 
##D lam <- 50
##D ## parameter beta distribution (radii)
##D theta <- list("size"=list("shape1"=1,"shape2"=10))
##D 
##D # simulation bounding box
##D box <- list("xrange"=c(-1,4),"yrange"=c(-1.5,3.5),"zrange"=c(0,2))
##D 
##D ## simulate and return full spheres system
##D ## intersect with XZ plane and return full list of intersection profiles
##D 
##D ## section plane xy
##D S <- simPoissonSystem(theta,lam,size="rbeta",box=box,type="spheres",
##D 		intersect="full",n=c(0,0,1),dz=0,pl=1)
##D 
##D # check resulting distribution
##D length(S$S)
##D summary(sapply(S$S,"[[","r"))
##D theta$size[[1]]/(theta$size[[1]]+theta$size[[2]])			# mean
##D 
##D ## interior spheres:
##D ## the ones which intersect one of the lateral planes (without top/bottom planes)
##D ## showing spheres with color intersect 
##D notIn <- sapply(S$S,function(x) !attr(x,"interior"))
##D spheres(S$S[notIn],box,FALSE,TRUE,color=col)
##D 
##D # not intersecting
##D In <- sapply(S$S,function(x) attr(x,"interior"))
##D spheres(S$S[In],box,color="gray")
##D 
##D ## full sphere system
##D # open3d()
##D # spheres(S$S,box,FALSE,TRUE,color=col)
##D # planes3d(0,0,1,0,col="darkgray",alpha=1)
##D 
##D ## draw intersections
##D sp <- S$sp
##D id <- sapply(sp,"[[","id") 
##D open3d()
##D spheres(S$S[id],box,FALSE,TRUE,color=col)
##D planes3d(0,0,1,0,col="darkgray",alpha=1)
##D 
##D XYr <- t(sapply(sp,function(s) cbind(s$center[1],s$center[2],s$r)))
##D # centers
##D x <- XYr[,1]
##D y <- XYr[,2]
##D r <- XYr[,3]
##D win <- attr(sp,"win")
##D xlim <- win[[1]]
##D ylim <- win[[2]] 
##D 
##D dev.new()
##D plot(x,y,type="n",xaxs="i", yaxs="i", xlab="x",ylab="y",xlim=xlim,ylim=ylim)
##D for(i in 1:nrow(XYr))
##D  draw.circle(x[i],y[i],r[i],nv=100,border=NULL,col="black")
##D 
##D ## digitize inersections
##D ## `win` can also be omitted if not different
##D ## from original itersection window (derived from the box)
##D W <- digitizeProfiles(sp, delta=0.01, win=win)
##D dim(W)
##D dev.new()
##D image(1:nrow(W),1:ncol(W),W,col=gray(1:0))
##D 
##D #################################################################
##D ## Exact simulation of spheres with log normal radii
##D #################################################################
##D 
##D lam <- 100
##D ## parameter rlnorm distribution (radii)
##D theta <- list("size"=list("meanlog"=-2.5,"sdlog"=0.5))
##D # simulation bounding box
##D box <- list("xrange"=c(0,5),"yrange"=c(0,5),"zrange"=c(0,5))
##D ## simulate only 3D system
##D S <- simPoissonSystem(theta,lam,size="rlnorm",box=box,type="spheres",
##D 		intersect="original", perfect=TRUE, pl=101)
##D ## show
##D open3d()
##D spheres(S[1:2000],box,TRUE,TRUE,color=col)
##D 
##D ## check!
##D mean(log(sapply(S,"[[","r")))
##D sd(log(sapply(S,"[[","r")))
##D 
##D #################################################################
##D ## Planar section
##D #################################################################
##D 
##D # planar section of exact simulated `rlnorm` sphere system:
##D # returns diameters for those section profiles
##D # which have their centers inside the intersection window
##D sp <- planarSection(S,d=2.5,intern=TRUE,pl=1)
##D hist(sp)
##D summary(sp)
##D mean(log(sp/2))
##D sd(log(sp/2))
##D 
##D #################################################################
##D ## General intersection, all objects (inter=FALSE)
##D #################################################################
##D 
##D SP <- intersectSystem(S, 2.5, n=c(0,0,1), intern=FALSE, pl=1)
##D 
##D ## show in 3D
##D id <- sapply(SP,"[[","id") 
##D open3d()
##D spheres(S[id],box,TRUE,color=col)
##D planes3d(0,0,-1,2.5,col="black",alpha=1)
##D 
##D ## 2D sections
##D XYr <- t(sapply(SP,function(s) cbind(s$center[1],s$center[2],s$r)))
##D # centers
##D x <- XYr[,1]
##D y <- XYr[,2]
##D r <- XYr[,3]
##D xlim <- box$xrange
##D ylim <- box$yrange 
##D 
##D dev.new()
##D plot(x,y,type="n",xaxs="i", yaxs="i", xlab="x",ylab="y",xlim=xlim,ylim=ylim)
##D for(i in 1:nrow(XYr))
##D 	draw.circle(x[i],y[i],r[i],nv=100,border=NULL,col="black")
##D 
##D # digitize
##D W <- digitizeProfiles(SP, delta=0.01)
##D dev.new()
##D image(1:nrow(W),1:ncol(W),W,col=gray(1:0))
##D 
##D 
##D #################################################################
##D ## Unfolding
##D #################################################################
##D 
##D ret <- unfold(sp,nclass=25)
##D 
##D ## Point process intensity
##D cat("Intensities: ", sum(ret$N_V)/25, "vs.",lam,"\n")
##D 
##D ## original diameters
##D r3d <- unlist(lapply(S,function(x) 2*x$r))
##D rest3d <- unlist(lapply(2:(length(ret$breaks)),
##D 				function(i) rep(ret$breaks[i],sum(ret$N_V[i-1]))))
##D 
##D op <- par(mfrow = c(1, 2))
##D hist(r3d[r3d<=max(ret$breaks)], breaks=ret$breaks, main="Radius 3D",
##D 		freq=FALSE, col="gray",xlab="r")
##D hist(rest3d, breaks=ret$breaks,main="Radius estimated",
##D 		freq=FALSE, col="gray", xlab="r")
##D par(op)
##D 
##D 
##D #################################################################
##D ## Update intersection: find objects which intersect bounding box
##D #################################################################
##D 
##D idx <- updateIntersections(S)
##D sum(!idx)							# objects intersecting
##D id <- which( idx != 1)				
##D open3d()
##D spheres(S[id],box,TRUE,TRUE,color=col)
##D 
##D #################################################################
##D ## user-defined simulation function
##D #################################################################
##D 
##D lam <- 50
##D theta <- list("p1"=-2.5,"p2"=0.5)
##D myfun <- function(p1,p2) { c("r"=rlnorm(1,p1,p2)) }
##D 
##D box <- list("xrange"=c(0,5),"yrange"=c(0,5),"zrange"=c(0,5))
##D 
##D S <- simPoissonSystem(theta,lam,rjoint=myfun,box=box,type="spheres",pl=1)
##D r <- sapply(S,"[[","r")
##D mean(log(r))
##D sd(log(r))
##D 
##D open3d()
##D spheres(S,box,TRUE,TRUE,color=col)
## End(Not run)



