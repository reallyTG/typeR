library(bootstrap)


### Name: boott
### Title: Bootstrap-t Confidence Limits
### Aliases: boott
### Keywords: nonparametric

### ** Examples

#  estimated confidence points for the mean
   x <- rchisq(20,1)
   theta <- function(x){mean(x)}
   results <- boott(x,theta)
# estimated confidence points for the mean, 
#  using variance-stabilization bootstrap-T method
   results <-  boott(x,theta,VS=TRUE)
   results$confpoints          # gives confidence points
# plot the estimated var stabilizing transformation
   plot(results$theta,results$g) 
# use standard formula for stand dev of mean
# rather than an inner bootstrap loop
   sdmean <- function(x, ...) 
       {sqrt(var(x)/length(x))}
   results <-  boott(x,theta,sdfun=sdmean) 
                                     
# To bootstrap functions of more  complex data structures, 
# write theta so that its argument x
#  is the set of observation numbers  
#  and simply  pass as data to boot the vector 1,2,..n. 
# For example, to bootstrap
# the correlation coefficient from a set of 15 data pairs:                              
    xdata <- matrix(rnorm(30),ncol=2)
    n <- 15
    theta <- function(x, xdata){ cor(xdata[x,1],xdata[x,2]) }
    results <- boott(1:n,theta, xdata)



