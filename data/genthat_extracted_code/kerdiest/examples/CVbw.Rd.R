library(kerdiest)


### Name: CVbw
### Title: Computes the cross-validation bandwidth of Bowman et al (1998).
### Aliases: CVbw
### Keywords: smooth nonparametric

### ** Examples

##  Compute the cross-validation bandwidth for a sample of 100 random N(0,1) data
x<-rnorm(100,0,1)
num_bws <- 50
seq_bws <- seq(((max(x)-min(x))/2)/50,(max(x)-min(x))/2,length=num_bws) 
hCV <- CVbw(type_kernel="e", vec_data=x, n_pts=200, seq_bws=seq_bws)
hCV
##  The CV function is plotted
h_CV<-CVbw(vec_data=x)
h_CV$bw
plot(h_CV$seq_bws, h_CV$CVfunction, type="l")
## Not run: 
##D ##  Plotting the distribution function estimate controling the grid points 
##D ## and the kernel function
##D ss <- quantile(x, c(0.05, 0.95))
##D # number of points to be used in the representation of estimated distribution
##D # function
##D n_pts <- 100  
##D y <- seq(ss[1],ss[2],length.out=n_pts)
##D F_CV<-kde(type_kernel="e", x, y, h_CV$bw)$Estimated_values
##D ##  plot of the theoretical and estimated distribution functions
##D require(graphics)
##D plot(y,F_CV, type="l", lty=2)
##D lines(y, pnorm(y),type="l", lty=1)
##D legend(-1,0.8,c("real","nonparametric"),lty=1:2)
## End(Not run)



