library(adegenet)


### Name: monmonier
### Title: Boundary detection using Monmonier algorithm
### Aliases: monmonier optimize.monmonier plot.monmonier print.monmonier
### Keywords: multivariate spatial

### ** Examples

if(require(spdep)){

### non-interactive example

# est-west separation
load(system.file("files/mondata1.rda",package="adegenet"))
cn1 <- chooseCN(mondata1$xy,type=2,ask=FALSE)
mon1 <- monmonier(mondata1$xy,dist(mondata1$x1),cn1,threshold=2)
plot(mon1,mondata1$x1)
plot(mon1,mondata1$x1,met="greylevel",add.arr=FALSE,col="red",bwd=6,lty=2)

# square in the middle
load(system.file("files/mondata2.rda",package="adegenet"))
cn2 <- chooseCN(mondata2$xy,type=1,ask=FALSE)
mon2 <- monmonier(mondata2$xy,dist(mondata2$x2),cn2,threshold=2)
plot(mon2,mondata2$x2,method="greylevel",add.arr=FALSE,bwd=6,col="red",csize=.5)

### genetic data example
## Not run: 
##D data(sim2pop)
##D 
##D if(require(hierfstat)){
##D ## try and find the Fst
##D fstat(sim2pop,fst=TRUE)
##D # Fst = 0.038
##D }
##D 
##D ## run monmonier algorithm
##D 
##D # build connection network
##D gab <- chooseCN(sim2pop@other$xy,ask=FALSE,type=2)
##D 
##D # filter random noise 
##D pca1 <- dudi.pca(sim2pop@tab,scale=FALSE, scannf=FALSE, nf=1)
##D 
##D # run the algorithm
##D mon1 <- monmonier(sim2pop@other$xy,dist(pca1$l1[,1]),gab,scanthres=FALSE)
##D 
##D # graphical display 
##D plot(mon1,var=pca1$l1[,1])
##D temp <- sim2pop@pop
##D levels(temp) <- c(17,19)
##D temp <- as.numeric(as.character(temp))
##D plot(mon1)
##D points(sim2pop@other$xy,pch=temp,cex=2)
##D legend("topright",leg=c("Pop A", "Pop B"),pch=c(17,19))
##D 
##D 
##D ### interactive example
##D 
##D # north-south separation
##D xy <- matrix(runif(120,0,10), ncol=2)
##D x1 <- rnorm(60)
##D x1[xy[,2] > 5] <- x1[xy[,2] > 5]+3
##D cn1 <- chooseCN(xy,type=1,ask=FALSE)
##D mon1 <- optimize.monmonier(xy,dist(x1)^2,cn1,ntry=10)
##D 
##D # graphics
##D plot(mon1,x1,met="greylevel",csize=.6)
##D 
##D # island in the middle
##D x2 <- rnorm(60)
##D sel <- (xy[,1]>3.5 & xy[,2]>3.5 & xy[,1]<6.5 & xy[,2]<6.5)
##D x2[sel] <- x2[sel]+4
##D cn2 <- chooseCN(xy,type=1,ask=FALSE)
##D mon2 <- optimize.monmonier(xy,dist(x2)^2,cn2,ntry=10)
##D 
##D # graphics
##D plot(mon2,x2,method="greylevel",add.arr=FALSE,bwd=6,col="red",csize=.5)
## End(Not run)
}



