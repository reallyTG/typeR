library(gjam)


### Name: gjamPredict
### Title: Predict gjam data
### Aliases: gjamPredict

### ** Examples

## Not run: 
##D S   <- 5
##D f   <- gjamSimData(n = 200, S = S, Q = 3, typeNames = 'CC') 
##D ml  <- list(ng = 50, burnin = 5, typeNames = f$typeNames, holdoutN = 10)
##D out <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
##D 
##D # predict data
##D par(mfrow=c(1,3),bty='n')             
##D gjamPredict(out, y2plot = colnames(f$ydata)) #predict the data in-sample
##D title('full sample')
##D 
##D # out-of-sample prediction
##D xdata     <- f$xdata[1:20,]
##D xdata[,3] <- mean(f$xdata[,3])     # mean for x[,3]
##D xdata[,2] <- seq(-2,2,length=20)   # gradient x[,2]
##D newdata   <- list(xdata = xdata, nsim = 50 )
##D p1 <- gjamPredict(out, newdata = newdata)
##D 
##D # plus/minus 1 prediction SE, default effort = 1000
##D x2   <- p1$x[,2]
##D ylim <- c(0, max(p1$sdList$yMu[,1] + p1$sdList$yPe[,1]))
##D plot(x2, p1$sdList$yMu[,1],type='l',lwd=2, ylim=ylim, xlab='x2',
##D      ylab = 'Predicted')
##D lines(x2, p1$sdList$yMu[,1] + p1$sdList$yPe[,1], lty=2)
##D lines(x2, p1$sdList$yMu[,1] - p1$sdList$yPe[,1], lty=2)
##D 
##D # .95 prediction error
##D lines(x2, p1$piList$yLo[,1], lty=3)
##D lines(x2, p1$piList$yHi[,1], lty=3)
##D title('SE and prediction, Sp 1')
##D 
##D # conditional prediction
##D ydataCond <- out$inputs$y[,1,drop=FALSE]*0          #set first column to zero
##D newdata   <- list(ydataCond = ydataCond, nsim=50)
##D p0        <- gjamPredict(output = out, newdata = newdata)
##D 
##D ydataCond <- ydataCond + 20                  #first column is 20
##D newdata   <- list(ydataCond = ydataCond, nsim=50)
##D p1        <- gjamPredict(output = out, newdata = newdata)
##D 
##D plot(out$inputs$y[,4],p0$sdList$yMu[,4], cex=.4,col='orange'); abline(0,1,lty=2)
##D points(out$inputs$y[,4],p1$sdList$yMu[,4], cex=.4,col='blue')
##D title('Cond. on 1st Sp')
## End(Not run)



