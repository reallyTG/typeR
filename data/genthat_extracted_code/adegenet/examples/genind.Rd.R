library(adegenet)


### Name: genind class
### Title: adegenet formal class (S4) for individual genotypes
### Aliases: genind-class print,genind-method show,genind-method
###   names,genind-method summary,genind-method print,genindSummary-method
###   print.genindSummary is.genind .valid.genind
### Keywords: classes manip multivariate

### ** Examples

showClass("genind")

obj <- read.genetix(system.file("files/nancycats.gtx",package="adegenet"))
obj
validObject(obj)
summary(obj)

## Not run: 
##D # test inter-colonies structuration
##D if(require(hierfstat)){
##D gtest <- gstat.randtest(obj,nsim=99)
##D gtest
##D plot(gtest)
##D }
##D 
##D # perform a between-class PCA
##D pca1 <- dudi.pca(scaleGen(obj, NA.method="mean"),scannf=FALSE,scale=FALSE)
##D pcabet1 <- between(pca1,obj@pop,scannf=FALSE)
##D pcabet1
##D 
##D s.class(pcabet1$ls,obj@pop,sub="Inter-class PCA",possub="topleft",csub=2)
##D add.scatter.eig(pcabet1$eig,2,xax=1,yax=2)
##D 
## End(Not run)



