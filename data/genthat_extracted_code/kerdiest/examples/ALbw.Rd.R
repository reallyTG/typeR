library(kerdiest)


### Name: ALbw
### Title: Computes the plug-in bandwidth of Altman and Leger.
### Aliases: ALbw
### Keywords: smooth nonparametric

### ** Examples

# Compute the plug-in bandwidth for a sample of 100 random N(0,1) data
x<-rnorm(100,0,1)
h_AL<- ALbw(type_kernel="e",vec_data=x)
h_AL
## Not run: 
##D ## A Quick plot of a distribution function estimate
##D x<-rnorm(1000)
##D h_AL<-ALbw(vec_data=x)
##D F_AL<-kde(vec_data=x, bw=h_AL)
##D plot(F_AL$grid,F_AL$Estimated_values,type="l")
## End(Not run)
## Not run: 
##D ##  Plotting the distribution function estimate controling the grid points
##D # and the kernel function
##D ss <- quantile(x, c(0.05, 0.95))
##D # number of points to be used in the representation of estimated distribution 
##D # function
##D n_pts <- 100 
##D y <- seq(ss[1],ss[2],length.out=n_pts)
##D F_AL <- kde(type_kernel="e", x, y, h_AL)$Estimated_values
##D ##  plot of the theoretical and estimated distribution functions
##D require(graphics)
##D plot(y,F_AL, type="l", lty=2)
##D lines(y, pnorm(y),type="l", lty=1)
##D legend(-1,0.8,c("real","nonparametric"),lty=1:2)
## End(Not run)



