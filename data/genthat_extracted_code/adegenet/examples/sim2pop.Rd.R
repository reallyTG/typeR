library(adegenet)


### Name: sim2pop
### Title: Simulated genotypes of two georeferenced populations
### Aliases: sim2pop
### Keywords: datasets

### ** Examples


## Not run: 
##D data(sim2pop)
##D 
##D if(require(hierfstat)){
##D ## try and find the Fst
##D temp <- genind2hierfstat(sim2pop)
##D varcomp.glob(temp[,1],temp[,-1])
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
##D mon1 <- monmonier(sim2pop@other$xy,dist(pca1$l1[,1]),gab, scanthres=FALSE)
##D 
##D # graphical display
##D temp <- sim2pop@pop
##D levels(temp) <- c(17,19)
##D temp <- as.numeric(as.character(temp))
##D plot(mon1)
##D points(sim2pop@other$xy,pch=temp,cex=2)
##D legend("topright",leg=c("Pop A", "Pop B"),pch=c(17,19))
## End(Not run)




