library(HIest)


### Name: spatial.AD
### Title: Simulate admixture in continuous, 2-dimensional space
### Aliases: spatial.AD
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D 	
##D # define space:
##D minX <- minY <- -3
##D maxX <- maxY <- 3
##D # 100 individuals randomly placed:
##D XY <- cbind(runif(100,minX,maxX),runif(100,minY,maxY)) 
##D # simulate secondary contact by sorting aling the x dimension and assigning parental genotypes on each side of the centerline:
##D XY <- XY[order(XY[,1]),]
##D Genotypes <- rbind(matrix(0,nrow=sum(XY[,1]<=0),ncol=10),matrix(1,nrow=sum(XY[,1]>0),ncol=10))
##D # competition parameters:
##D  sigmac <- 0.2; R <- 1.75; M <- 5
##D 
##D # selection, inlcuding heterozygote disadvantage at locus 2 and a DM incompatibility between 3 and 4:
##D beta <- 0
##D sel <- 0
##D mid <- 0
##D h <- 0.4
##D DM <- rbind(
##D c(0,0.2,0.4),
##D c(0,0.0,0.2),
##D c(0,0.0,0.0))
##D 
##D # simulate 10 generations, open to immigration:
##D G10 <- spatial.AD(minX,minY,maxX,maxY,XY,Genotypes,beta,sel,mid,h,DM,sigmac,R,M,gens=10,immigrants=TRUE)
##D 
## End(Not run)


