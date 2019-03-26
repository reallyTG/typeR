library(CORM)


### Name: fit.CLMM
### Title: Clustering of Linear Mixed Models Method
### Aliases: fit.CLMM
### Keywords: Functions

### ** Examples

#Example 1
#test data
  data(YeastCellCycle)
  data.y <- YeastCellCycle$normalizedData.sample
  data.x <- YeastCellCycle$designMatrix
#fit the model
  n.clst <- 6
  fit1 <- fit.CLMM(data.y, data.x, data.x, n.clst)

  fit1.u <- apply(fit1$u.hat, MARGIN=1, FUN=order, decreasing=TRUE)[1,]
  zeta.fitted <- fit1$theta.hat$zeta.hat
  profile <- data.x[1,,] %*% t(zeta.fitted)
#display the profile of each cluster
  n.knots <- 7
  plot.x <- n.knots*(1:dim(data.y)[3]-1)

  par(mfrow=c(2, ceiling((n.clst)/2)),mai=c(0.5,0.5,0.5,0.1),mgp=c(1,0.3,0))
  for(k in 1:n.clst){
  # plot the fitted cluster-specific profiles
    plot(plot.x,profile[,k],type="l", 
         ylim=c(-2,2), main=paste("Cluster",k), 
         xlab="time (min)", ylab=NA,xaxt="n",lwd=2)
    axis(side=1, at=plot.x[(1:8)*2-1], labels=paste(plot.x[(1:8)*2-1]), cex.axis=0.8)
  # plot the observed profiles for genes in this cluster
    i.plot <- (1:dim(data.y)[1])[fit1.u==k]
    for(j in i.plot) { lines(plot.x, data.y[j,1,], lty=3, lwd=1)}
    text(84,-1.9, paste(length(which(fit1.u==k)),"genes"))
  }

## Not run: 
##D #Example 2
##D #test data
##D   data(YeastCellCycle2)
##D   data.y <- YeastCellCycle2$normalizedData.WT
##D   data.x <- YeastCellCycle2$designMatrix.WT
##D #fit the model
##D   n.clst <- 8
##D   fit1   <- fit.CLMM(data.y,data.x[,,1:9],data.x[,,1:9],n.clst)
##D   fit1.u <- apply(fit1$u.hat, MARGIN=1, FUN=order, decreasing=TRUE)[1,]
##D   zeta.fitted <- fit1$theta.hat$zeta.hat
##D   profile.WT <- YeastCellCycle2$designMatrix.WT[1,,1:9] %*% t(zeta.fitted)
##D #display the profile of each cluster
##D  # remove bad time points for WTs
##D   n.time  <- 25
##D   time.WT <- (1:n.time)[-22]
##D   n.rpl.WT<- length(time.WT)
##D   n.gene.short<- dim(data.y)[1]
##D  # gene-specific profile: observed profiles averaged over replicates
##D   data.WT.mean  <- matrix(0, nrow=n.gene.short, ncol=n.rpl.WT)
##D   for(j in 1:n.gene.short){
##D    data.WT.mean[j,]	<- (data.y[j,1,]+data.y[j,2,])/2
##D   }
##D  # plot observed profiles by cluster
##D   col.panel=rainbow(8)
##D   par(mfrow=c(3, 3),mai=c(0.3,0.25,0.2,0.05))
##D   for(k in 1:n.clst){
##D   plot(5*(time.WT-1), profile.WT[,k], type="l", col=col.panel[k], ylim=c(-2,2),
##D        xlab="Time", ylab="Expression Value", main=paste("WT: cluster",k))
##D   i.plot 	<- (1:n.gene.short)[fit1.u==k]
##D   for(j in i.plot) lines(5*(time.WT-1), data.WT.mean[j,], lty=1)
##D   lines(5*(time.WT-1), profile.WT[,k], col=col.panel[k], lwd=2)
##D   text(125, -1.9, pos=2, paste(length(i.plot)," genes"))
##D   }
## End(Not run)



