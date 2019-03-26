library(kerdiest)


### Name: PBbw
### Title: Computes the plug-in bandwidth of Polansky and Baker.
### Aliases: PBbw
### Keywords: smooth nonparametric

### ** Examples

# Compute the plug-in bandwidth for a sample of 100 random N(0,1) data
x<-rnorm(100,0,1)
h_PB<-PBbw(vec_data=x,num_stage=4)
h_PB
## Not run: 
##D ## A Quick plot of a distribution function estimate
##D x<-rnorm(1000)
##D h_PB<-PBbw(vec_data=x)
##D F_PB<-kde(vec_data=x, bw=h_PB)
##D plot(F_PB$grid, F_PB$Estimated_values, type="l")
## End(Not run)
## Not run: 
##D ##  Plotting the distribution function estimate controling the grid points and 
##D ## the kernel function
##D ss <- quantile(x, c(0.05, 0.95))
##D # number of points to be used in the representation of the estimated
##D # distribution function
##D n_pts <- 100  
##D y <- seq(ss[1],ss[2],length.out=n_pts)
##D F_PB <- kde(type_kernel="e", x, y, h_PB)$Estimated_values
##D ##  plot of the theoretical and estimated distribution functions
##D require(graphics)
##D plot(y,F_PB, type="l", lty=2)
##D lines(y, pnorm(y),type="l", lty=1)
##D legend(-1.2,0.8,c("real","nonparametric"),lty=1:2)
## End(Not run)



