library(CORM)


### Name: fit.CLMM.2
### Title: Clustering of Linear Mixed Models Method
### Aliases: fit.CLMM.2
### Keywords: Functions

### ** Examples

## Not run: 
##D #test data
##D  data(YeastCellCycle2)
##D  data.y1 <- YeastCellCycle2$normalizedData.WT
##D  data.x1 <- YeastCellCycle2$designMatrix.WT
##D  data.y2 <- YeastCellCycle2$normalizedData.SM
##D  data.x2 <- YeastCellCycle2$designMatrix.SM
##D  n.clst  <- 8
##D  fit1	<- fit.CLMM.2(data.y1=data.y1,data.x1=data.x1,data.z1=data.x1,
##D                       data.y2=data.y2,data.x2=data.x2,data.z2=data.x2,
##D 					  n.clst=n.clst)
##D  fit1.u  <- apply(fit1$u.hat, MARGIN=1, FUN=order, decreasing=TRUE)[1,]
##D  zeta.fitted <- fit1$theta.hat$zeta.hat
##D  profile.WT  <- YeastCellCycle2$designMatrix.WT[1,,] %*% t(zeta.fitted)
##D  profile.SM  <- YeastCellCycle2$designMatrix.SM[1,,] %*% t(zeta.fitted)
##D # remove bad time points for WTs and SMs
##D  n.time  <- 25
##D  time.WT <- (1:n.time)[-22]
##D  time.SM <- (1:n.time)[-c(6,9,12)]
##D  n.rpl.WT<- length(time.WT)
##D  n.rpl.SM<- length(time.SM)
##D  n.gene.short<-dim(YeastCellCycle2$normalizedData.WT)[1]
##D # gene-specific profile: observed profiles averaged over replicates
##D  data.WT.mean  <- matrix(0, nrow=n.gene.short, ncol=n.rpl.WT)
##D  data.SM.mean	<- matrix(0, nrow=n.gene.short, ncol=n.rpl.SM)
##D  for(j in 1:n.gene.short){
##D   data.WT.mean[j,] <- (YeastCellCycle2$normalizedData.WT[j,1,]+
##D                        YeastCellCycle2$normalizedData.WT[j,2,])/2
##D   data.SM.mean[j,] <- (YeastCellCycle2$normalizedData.SM[j,1,]+
##D                        YeastCellCycle2$normalizedData.SM[j,2,])/2
##D  }
##D # plot observed profiles by cluster -- wild type
##D  col.panel=rainbow(8)
##D  par(mai=c(0.3,0.25,0.2,0.05),mfrow=c(3,3))
##D  for(k in 1:n.clst){
##D   plot(5*(time.WT-1), profile.WT[,k], type="l", col=col.panel[k], ylim=c(-2,2),
##D        xlab="Time", ylab="Expression Value", main=paste("WT: cluster",k))
##D   i.plot <- (1:n.gene.short)[fit1.u==k]
##D   for(j in i.plot) lines(5*(time.WT-1), data.WT.mean[j,], lty=1)
##D   lines(5*(time.WT-1), profile.WT[,k], col=col.panel[k], lwd=2)
##D   text(125, -1.9, pos=2, paste(length(i.plot)," genes"))
##D }
##D # plot observed profiles by cluster -- single mutant
##D  par(mai=c(0.3,0.25,0.2,0.05),mfrow=c(3,3))
##D  for(k in 1:n.clst){
##D   plot(5*(time.SM-1), profile.SM[,k], type="l", col=col.panel[k], ylim=c(-2,2),
##D        xlab="Time", ylab="Expression Value", main=paste("SM: cluster",k))
##D   i.plot <- (1:n.gene.short)[fit1.u==k]
##D   for(j in i.plot) lines(5*(time.SM-1), data.SM.mean[j,], lty=1)
##D   lines(5*(time.SM-1), profile.SM[,k], col=col.panel[k], lwd=2)
##D   text(125, -1.9, pos=2, paste(length(i.plot)," genes"))
##D }
##D # plot fitted profiles by cluster
##D  par(mai=c(0.3,0.25,0.2,0.05),mfrow=c(3,3))
##D  for(k in 1:n.clst){ 
##D   plot(5*(time.WT-1), profile.WT[,k], type="l", ylim=c(-2,2), 
##D        xlab="Time", ylab="Expression Value", lwd=2)
##D   title(paste("Cluster", k))
##D   lines(5*(time.SM-1), profile.SM[,k], lty=3, lwd=2)
##D   if(k==1) legend(60, 2, c("WT", "SM"), lty=1:2, cex=0.8)
##D  }
## End(Not run)



