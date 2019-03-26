library(zoib)


### Name: BiRepeated
### Title: Data from a correlated bivariate beta distribution with repeated
###   measures
### Aliases: BiRepeated
### Keywords: datasets

### ** Examples

  ## Not run: 
##D   library(zoib)
##D   data("BiRepeated", package = "zoib")
##D   eg2 <- zoib(y1|y2 ~ x|1|x, data= BiRepeated, random=1,n.response=2,
##D               EUID= BiRepeated$id, joint=TRUE,zero.inflation = FALSE,
##D               one.inflation = FALSE, prior.Sigma = "VC.unif",  			
##D               n.iter=7000,n.thin=25,n.burn=2000)
##D   coeff <- eg2$coeff
##D   summary(coeff)
##D   
##D   ### check convergence
##D   traceplot(coeff); 
##D   autocorr.plot(coeff); 
##D   check.psrf(coeff)
##D   
##D   ### plot posterior mean of y vs. observed y to check on goodness of fit.
##D   n= nrow(BiRepeated)
##D   ypred1 = rbind(eg2$ypred[[1]][,1:n],eg2$ypred[[2]][,1:n])
##D   ypred2 = rbind(eg2$ypred[[1]][,(n+1):(2*n)],eg2$ypred[[2]][,(n+1):(2*n)])
##D   post.mean1 = apply(ypred1,2,mean); 
##D   post.mean2 = apply(ypred2,2,mean); 
##D   
##D   plot(BiRepeated$y1, post.mean1, xlim=c(0,1),ylim=c(0,1), col='green2',
##D        pch=2,xlab='Observed y', ylab='Predicted y', main="")
##D   points(BiRepeated$y2,post.mean2,col='purple')
##D   abline(0,1,col='red')
##D   legend(0.1,0.9,col=c('green2','purple'),c("y1","y2"),pch=c(2,1))
##D   
## End(Not run)



