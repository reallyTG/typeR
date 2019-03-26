library(adegenet)


### Name: microbov
### Title: Microsatellites genotypes of 15 cattle breeds
### Aliases: microbov
### Keywords: datasets

### ** Examples


## Not run: 
##D data(microbov)
##D microbov
##D summary(microbov)
##D 
##D # make Y, a genpop object
##D Y <- genind2genpop(microbov)
##D 
##D # make allelic frequency table
##D temp <- makefreq(Y,missing="mean")
##D X <- temp$tab
##D nsamp <- temp$nobs
##D 
##D # perform 1 PCA per marker
##D 
##D kX <- ktab.data.frame(data.frame(X),Y@loc.n.all)
##D 
##D kpca <- list()
##D for(i in 1:30) {kpca[[i]] <- dudi.pca(kX[[i]],scannf=FALSE,nf=2,center=TRUE,scale=FALSE)}
##D 
##D 
##D sel <- sample(1:30,4)
##D col = rep('red',15)
##D col[c(2,10)] = 'darkred'
##D col[c(4,12,14)] = 'deepskyblue4'
##D col[c(8,15)] = 'darkblue'
##D 
##D # display %PCA
##D par(mfrow=c(2,2))
##D for(i in sel) {
##D s.multinom(kpca[[i]]$c1,kX[[i]],n.sample=nsamp[,i],coulrow=col,sub=locNames(Y)[i])
##D add.scatter.eig(kpca[[i]]$eig,3,xax=1,yax=2,posi="top")
##D }
##D 
##D # perform a Multiple Coinertia Analysis
##D kXcent <- kX
##D for(i in 1:30) kXcent[[i]] <- as.data.frame(scalewt(kX[[i]],center=TRUE,scale=FALSE))
##D mcoa1 <- mcoa(kXcent,scannf=FALSE,nf=3, option="uniform")
##D 
##D # coordinated %PCA
##D mcoa.axes <- split(mcoa1$axis, Y@loc.fac)
##D mcoa.coord <- split(mcoa1$Tli,mcoa1$TL[,1])
##D var.coord <- lapply(mcoa.coord,function(e) apply(e,2,var))
##D 
##D par(mfrow=c(2,2))
##D for(i in sel) {
##D s.multinom(mcoa.axes[[i]][,1:2],kX[[i]],n.sample=nsamp[,i],coulrow=col,sub=locNames(Y)[i])
##D add.scatter.eig(var.coord[[i]],2,xax=1,yax=2,posi="top")
##D }
##D 
##D # reference typology
##D par(mfrow=c(1,1))
##D s.label(mcoa1$SynVar,lab=popNames(microbov),sub="Reference typology",csub=1.5)
##D add.scatter.eig(mcoa1$pseudoeig,nf=3,xax=1,yax=2,posi="top")
##D 
##D # typologial values
##D tv <- mcoa1$cov2
##D tv <- apply(tv,2,function(c) c/sum(c))*100
##D rownames(tv) <- locNames(Y)
##D tv <- tv[order(locNames(Y)),]
##D 
##D par(mfrow=c(3,1),mar=c(5,3,3,4),las=3)
##D for(i in 1:3){
##D barplot(round(tv[,i],3),ylim=c(0,12),yaxt="n",main=paste("Typological value -
##D structure",i))
##D axis(side=2,at=seq(0,12,by=2),labels=paste(seq(0,12,by=2),"%"),cex=3)
##D abline(h=seq(0,12,by=2),col="grey",lty=2)
##D }
## End(Not run)




