library(adespatial)


### Name: aem
### Title: Construct asymmetric eigenvector maps (AEM)
### Aliases: aem
### Keywords: spatial

### ** Examples

### Construction of object of class nb (spdep)
if(require("spdep", quietly = TRUE)){
nb <- cell2nb(5,5,"queen")

### Create fictitious geographical coordinates 
xy <- cbind(1:25,expand.grid(1:5,1:5))

### Build binary site-by-link matrix
bin.mat <- aem.build.binary(nb,xy)

### Construct AEM eigenfunctions from an object of class aem.build.binary
res <- aem(aem.build.binary=bin.mat,rm.link0=FALSE)
res$values

### Illustrate 4 AEM eigenfunctions using bubble plots
opal <- palette()
palette(c("black","white"))
par(mfrow=c(2,2))
symbols(x=xy[,2:3], circles=abs(res$vectors[,1]), inches=FALSE, asp=1,
 fg=ifelse(sign(-res$vectors[,1])+1>0,1,0), 
 bg=ifelse(sign(res$vectors[,1])+1>0,1,0), xlab="x", ylab="y")
title("AEM 1")
symbols(x=xy[,2:3], circles=abs(res$vectors[,2]), inches=FALSE, 
asp=1, fg=ifelse(sign(-res$vectors[,2])+1>0,1,0),
 bg=ifelse(sign(res$vectors[,2])+1>0,1,0), xlab="x", ylab="y")
title("AEM 2")
symbols(x=xy[,2:3], circles=abs(res$vectors[,3]), inches=FALSE, 
asp=1, fg=ifelse(sign(-res$vectors[,3])+1>0,1,0), 
bg=ifelse(sign(res$vectors[,3])+1>0,1,0), xlab="x", ylab="y")
title("AEM 3")
symbols(x=xy[,2:3], circles=abs(res$vectors[,4]), inches=FALSE, asp=1,
 fg=ifelse(sign(-res$vectors[,4])+1>0,1,0), 
 bg=ifelse(sign(res$vectors[,4])+1>0,1,0), xlab="x", ylab="y")
title("AEM 4")

### Construct AEM eigenfunctions using only a site-by-link matrix
res2 <- aem(binary.mat=bin.mat[[1]])
res2$values

### Illustrate 4 AEM eigenfunctions using bubble plots
par(mfrow=c(2,2))
symbols(x=xy[,2:3], circles=abs(res2$vectors[,1]), inches=FALSE, 
asp=1, fg=ifelse(sign(-res2$vectors[,1])+1>0,1,0), 
bg=ifelse(sign(res2$vectors[,1])+1>0,1,0), xlab="x", ylab="y")
title("AEM 1")
symbols(x=xy[,2:3], circles=abs(res2$vectors[,2]), inches=FALSE,
asp=1, fg=ifelse(sign(-res2$vectors[,2])+1>0,1,0), 
bg=ifelse(sign(res2$vectors[,2])+1>0,1,0), xlab="x", ylab="y")
title("AEM 2")
symbols(x=xy[,2:3], circles=abs(res2$vectors[,3]), inches=FALSE,
asp=1, fg=ifelse(sign(-res2$vectors[,3])+1>0,1,0), 
bg=ifelse(sign(res2$vectors[,3])+1>0,1,0), xlab="x", ylab="y")
title("AEM 3")
symbols(x=xy[,2:3], circles=abs(res2$vectors[,4]), inches=FALSE,asp=1,
 fg=ifelse(sign(-res2$vectors[,4])+1>0,1,0), 
 bg=ifelse(sign(res2$vectors[,4])+1>0,1,0), xlab="x", ylab="y")
title("AEM 4")

palette(opal)

### Construct AEM eigenfunctions with a function of the distance
### as weights to put on the links

### Construction of object of class nb (spdep)
nb<-cell2nb(5,5,"queen")

### Create fictitious geographical coordinates
xy <- cbind(1:25,expand.grid(1:5,1:5))

### Build binary site-by-link matrix
bin.mat <- aem.build.binary(nb,xy)

### Construct a matrix of distances
long.lien.mat<-as.matrix(dist(xy))

### Extract the edges, remove the ones directly linked to site 0
lien.b<-bin.mat$edges[-1:-5,]

### Construct a vector giving the length of each edge
long.lien<-vector(length=nrow(lien.b))

for(i in 1:nrow(lien.b)){
	long.lien[i]<-long.lien.mat[lien.b[i,1],lien.b[i,2]]
}

### Construct a vector of weights based on distance
weight.vec<-1-(long.lien/max(long.lien))^2

### Construct AEM eigenfunctions from an object of class aem.build.binary
res <- aem(aem.build.binary=bin.mat,weight=weight.vec,rm.link0=TRUE)
res
}



