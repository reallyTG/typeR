library(CORM)


### Name: fit.CLM
### Title: Clustering of Linear Models Method
### Aliases: fit.CLM
### Keywords: Functions

### ** Examples

#Example 1
 #test data
  data(BreastCancer)
  data.y <- BreastCancer$normalizedData
  data.x <- BreastCancer$designMatrix
 #fit the model
  n.clst <- 9
  fit1   <- fit.CLM(data.y, data.x, n.clst)
  fit1.u <- apply(fit1$u.hat, MARGIN=1, FUN=order, decreasing=TRUE)[1,]
 #display the results
  index.IDC <- which(data.x[,2]==0)
  index.ILC <- which(data.x[,2]==1)
  mean.IDC  <- apply(data.y[,index.IDC], MARGIN=1, FUN=mean, na.rm=TRUE)
  mean.ILC  <- apply(data.y[,index.ILC], MARGIN=1, FUN=mean, na.rm=TRUE)

  color  <- rainbow(n.clst)
  par(mai=c(1,1,0.5,0.1),cex.axis=0.8, cex.lab=1,mgp=c(1.5,0.5,0))
  plot((mean.IDC+mean.ILC)/2, 
       (mean.IDC-mean.ILC), 
       xlab="(IDC mean + ILC mean)/2",
       ylab="IDC mean - ILC mean",
       pch=paste(fit1.u),
       col=color[fit1.u],
       main=paste("K=",n.clst))
 
## Not run: 
##D #Example 2
##D  #test data
##D   data(miRTargetGenes)
##D   data.y <- miRTargetGenes$normalizedData
##D   data.x <- miRTargetGenes$designMatrix
##D  #fit the model
##D   n.clst <- 9
##D   n.start<- 20
##D   fit2  	 <- fit.CLM(data.y, data.x, n.clst, n.start)
##D   fit2.u   <- apply(fit2$u.hat, MARGIN=1, FUN=order, decreasing=TRUE)[1,]
##D   fit2.u.o <- factor(fit2.u, levels=c(1,5,6,7,4,8,2,9,3), labels=1:9)
##D   library(limma)
##D   plot.y   <- lmFit(data.y, data.x)$coef %*% cbind(c(1,0,0,0),c(1,0,1,0),c(1,1,0,0),c(1,1,1,1))
##D   plot.x   <- 1:4
##D  #display the results
##D   color		 <- rainbow(n.clst)
##D   par(mfrow=c(3,4),mai=c(0.35, 0.4, 0.4, 0.2), mgp=c(1.6,0.4,0), tck=-0.01, las=2)
##D   for(k in 1:n.clst){
##D    plot(plot.x, plot.y[1,], type="n", xaxt="n", ylim=range(plot.y), 
##D         xlab="", ylab="gene expression")
##D    axis(1, plot.x, c("Normal \n","Normal \n +miRNA","Tumor \n","Tumor \n +miRNA"), 
##D         las=1, cex.axis=1, mgp=c(1.5,1.2,0))
##D    title(paste("cluster", k))
##D    abline(h=0, lty=2)
##D    for(j in which(fit2.u.o==k)) points(plot.x, plot.y[j,], type="b", col=color[k])
##D   }
## End(Not run)



