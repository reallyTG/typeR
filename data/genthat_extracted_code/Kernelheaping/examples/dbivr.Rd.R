library(Kernelheaping)


### Name: dbivr
### Title: Bivariate kernel density estimation for rounded data
### Aliases: dbivr

### ** Examples

# Create Mu and Sigma  -----------------------------------------------------------
mu1 <- c(0, 0)
mu2 <- c(5, 3)
mu3 <- c(-4, 1)
Sigma1 <- matrix(c(4, 3, 3, 4), 2, 2)
Sigma2 <- matrix(c(3, 0.5, 0.5, 1), 2, 2)
Sigma3 <- matrix(c(5, 4, 4, 6), 2, 2)
# Mixed Normal Distribution -------------------------------------------------------
mus <- rbind(mu1, mu2, mu3)
Sigmas <- rbind(Sigma1, Sigma2, Sigma3)
props <- c(1/3, 1/3, 1/3)
## Not run: 
##D xtrue=rmvnorm.mixt(n=1000, mus=mus, Sigmas=Sigmas, props=props)
##D roundvalue=2
##D xrounded=plyr::round_any(xtrue,roundvalue)
##D est <- dbivr(xrounded,roundvalue=roundvalue,burnin=5,samples=10)
##D 
##D #Plot corrected and Naive distribution
##D plot(est,trueX=xtrue)
##D #for comparison: plot true density
##D  dens=dmvnorm.mixt(x=expand.grid(est$Mestimates$eval.points[[1]],est$Mestimates$eval.points[[2]]),
##D   mus=mus, Sigmas=Sigmas, props=props)
##D  dens=matrix(dens,nrow=length(est$gridx),ncol=length(est$gridy))
##D  contour(dens,x=est$Mestimates$eval.points[[1]],y=est$Mestimates$eval.points[[2]],
##D     xlim=c(min(est$gridx),max(est$gridx)),ylim=c(min(est$gridy),max(est$gridy)),main="True Density")
## End(Not run)



