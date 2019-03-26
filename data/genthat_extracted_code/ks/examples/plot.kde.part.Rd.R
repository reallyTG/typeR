library(ks)


### Name: plot.kde.part
### Title: Partition plot for kernel density clustering
### Aliases: plot.kde.part kms.part mvnorm.mixt.part
### Keywords: hplot

### ** Examples

## No test: 
## normal mixture partition
mus <- rbind(c(-1,0), c(1, 2/sqrt(3)), c(1,-2/sqrt(3)))
Sigmas <- 1/25*rbind(invvech(c(9, 63/10, 49/4)), invvech(c(9,0,49/4)), invvech(c(9,0,49/4)))
props <- c(3,3,1)/7
nmixt.part <- mvnorm.mixt.part(mus=mus, Sigmas=Sigmas, props=props)
plot(nmixt.part, asp=1, xlim=c(-3,3), ylim=c(-3,3))
## End(No test)
## Not run: 
##D ## kernel mean shift partition
##D set.seed(81928192)
##D x <- rmvnorm.mixt(n=1000, mus=mus, Sigmas=Sigmas, props=props)
##D msize <- round(151^2*0.05)
##D kms.nmixt.part <- kms.part(x=x, min.clust.size=msize)
##D plot(kms.nmixt.part, asp=1, xlim=c(-3,3), ylim=c(-3,3))
## End(Not run)


