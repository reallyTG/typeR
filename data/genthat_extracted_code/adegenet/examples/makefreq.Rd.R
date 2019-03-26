library(adegenet)


### Name: makefreq
### Title: Compute allelic frequencies
### Aliases: makefreq makefreq,genind-method makefreq,genind-methods
###   makefreq,genpop-method makefreq,genpop-methods
### Keywords: manip multivariate

### ** Examples


## Not run: 
##D data(microbov)
##D obj1 <- microbov
##D obj2 <- genind2genpop(obj1)
##D 
##D # perform a correspondance analysis on counts data
##D Xcount <- tab(obj2, NA.method="zero")
##D ca1 <- dudi.coa(Xcount,scannf=FALSE)
##D s.label(ca1$li,sub="Correspondance Analysis",csub=1.2)
##D add.scatter.eig(ca1$eig,nf=2,xax=1,yax=2,posi="topleft")
##D 
##D # perform a principal component analysis on frequency data
##D Xfreq <- makefreq(obj2, missing="mean")
##D Xfreq <- tab(obj2, NA.method="mean") # equivalent to line above
##D pca1 <- dudi.pca(Xfreq,scale=FALSE,scannf=FALSE)
##D s.label(pca1$li,sub="Principal Component Analysis",csub=1.2)
##D add.scatter.eig(pca1$eig,nf=2,xax=1,yax=2,posi="top")
## End(Not run)




