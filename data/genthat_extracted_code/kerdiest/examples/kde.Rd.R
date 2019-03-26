library(kerdiest)


### Name: kde
### Title: Kernel estimator of the distribution function
### Aliases: kde
### Keywords: smooth nonparametric

### ** Examples

# Comparison of three bandwidth selection methods

x<-rnorm(100)
# The bandwidths by cross-validation, plug-in of Altman and Leger
# and plug-in of Polansky and Baker are calculated, using a normal kernel and a 
# standard setting of parameters, in each case
h_CV<-CVbw(vec_data=x)$bw
# plug-in of Altman and Leger
h_AL<- ALbw(vec_data=x)
# plug-in of Polansky and Baker
h_PB<- PBbw(vec_data=x)
## Not run: 
##D print(h_CV); print(h_AL); print(h_PB)
##D # plot of the three estimates together with the real distribution
##D F_CV<-kde(vec_data=x, bw= h_CV)
##D F_AL<-kde(vec_data=x, bw= h_AL)
##D F_PB<-kde(vec_data=x, bw= h_PB)
##D y<-F_CV$grid
##D Ft<-pnorm(y)
##D require(graphics)
##D plot(y,Ft, ylab="Distribution", xlab="data", type="l", lty=1)
##D lines(y,F_CV$Estimated_values, type="l",lty=2)
##D lines(y,F_AL$Estimated_values, type="l",lty=3)
##D lines(y,F_PB$Estimated_values, type="l",lty=4)
##D 
##D legend(1,0.4,c("real","F_CV","F_AL","F_PB"),lty=1:4)  
## End(Not run)



