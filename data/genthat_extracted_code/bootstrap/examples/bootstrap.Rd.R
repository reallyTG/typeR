library(bootstrap)


### Name: bootstrap
### Title: Non-Parametric Bootstrapping
### Aliases: bootstrap
### Keywords: nonparametric

### ** Examples

# 100 bootstraps of the sample mean 
# (this is for illustration;  since "mean" is  a 
# built in function, bootstrap(x,100,mean) would be simpler!)
    x <- rnorm(20)                
    theta <- function(x){mean(x)} 
                              
    results <- bootstrap(x,100,theta)     
                             
# as above, but also estimate the 95th percentile   
# of the bootstrap dist'n of the mean, and         
# its jackknife-after-bootstrap  standard error    
                              
    perc95 <- function(x){quantile(x, .95)}
                             
                             
    results <-  bootstrap(x,100,theta, func=perc95)                                   
                                   
# To bootstrap functions of more complex data structures, 
# write theta so that its argument x
#  is the set of observation numbers  
#  and simply  pass as data to bootstrap the vector 1,2,..n. 
# For example, to bootstrap
# the correlation coefficient from a set of 15 data pairs:
   xdata <- matrix(rnorm(30),ncol=2)
   n <- 15
   theta <- function(x,xdata){ cor(xdata[x,1],xdata[x,2]) }
   results <- bootstrap(1:n,20,theta,xdata)



