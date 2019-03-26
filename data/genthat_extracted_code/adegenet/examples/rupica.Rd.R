library(adegenet)


### Name: rupica
### Title: Microsatellites genotypes of 335 chamois (Rupicapra rupicapra)
###   from the Bauges mountains (France)
### Aliases: rupica
### Keywords: datasets

### ** Examples



data(rupica)
rupica


## Not run: 
##D if(require(adehabitat)){
##D 
##D ## see the sampling area
##D showBauges <- rupica$other$showBauges
##D showBauges()
##D points(rupica$other$xy,col="red")
##D 
##D ## perform a sPCA
##D spca1 <- spca(rupica,type=5,d1=0,d2=2300,plot=FALSE,scannf=FALSE,nfposi=2,nfnega=0)
##D barplot(spca1$eig,col=rep(c("black","grey"),c(2,100)),main="sPCA eigenvalues")
##D screeplot(spca1,main="sPCA eigenvalues: decomposition")
##D 
##D ## data visualization
##D showBauges(,labcex=1)
##D s.value(spca1$xy,spca1$ls[,1],add.p=TRUE,csize=.5)
##D add.scatter.eig(spca1$eig,1,1,1,posi="topleft",sub="Eigenvalues")
##D 
##D showBauges(,labcex=1)
##D s.value(spca1$xy,spca1$ls[,2],add.p=TRUE,csize=.5)
##D add.scatter.eig(spca1$eig,2,2,2,posi="topleft",sub="Eigenvalues")
##D 
##D rupica$other$showBauges()
##D colorplot(spca1$xy,spca1$li,cex=1.5,add.plot=TRUE)
##D 
##D ## global and local tests
##D Gtest <- global.rtest(rupica@tab,spca1$lw,nperm=999)
##D Gtest
##D plot(Gtest)
##D Ltest <- local.rtest(rupica@tab,spca1$lw,nperm=999)
##D Ltest
##D plot(Ltest)
##D }
## End(Not run)




