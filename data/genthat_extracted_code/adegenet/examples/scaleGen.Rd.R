library(adegenet)


### Name: scaleGen
### Title: Compute scaled allele frequencies
### Aliases: scaleGen scaleGen-methods scaleGen,genind-method
###   scaleGen,genpop-method scaleGen,genind-method scaleGen,genpop-method
### Keywords: manip methods

### ** Examples


## Not run: 
##D ## load data
##D data(microbov)
##D obj <- genind2genpop(microbov)
##D 
##D ## compare different scaling
##D X1 <- scaleGen(obj)
##D X2 <- scaleGen(obj,met="bin")
##D 
##D ## compute PCAs
##D pcaObj <- dudi.pca(obj,scale=FALSE,scannf=FALSE) # pca with no scaling
##D pcaX1 <- dudi.pca(X1,scale=FALSE,scannf=FALSE,nf=100) # pca with usual scaling
##D pcaX2 <- dudi.pca(X2,scale=FALSE,scannf=FALSE,nf=100) # pca with scaling for binomial variance
##D 
##D ## get the loadings of alleles for the two scalings
##D U1 <- pcaX1$c1
##D U2 <- pcaX2$c1
##D 
##D 
##D ## find an optimal plane to compare loadings
##D ## use a procustean rotation of loadings tables
##D pro1 <- procuste(U1,U2,nf=2)
##D 
##D ## graphics
##D par(mfrow=c(2,2))
##D # eigenvalues
##D barplot(pcaObj$eig,main="Eigenvalues\n no scaling")
##D barplot(pcaX1$eig,main="Eigenvalues\n usual scaling")
##D barplot(pcaX2$eig,main="Eigenvalues\n 'binomial' scaling")
##D # differences between loadings of alleles
##D s.match(pro1$scor1,pro1$scor2,clab=0,sub="usual -> binom (procustean rotation)")
##D 
## End(Not run)




