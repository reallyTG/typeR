library(bootstrap)


### Name: jackknife
### Title: Jackknife Estimation
### Aliases: jackknife
### Keywords: nonparametric

### ** Examples

# jackknife values for the sample mean 
# (this is for illustration;  # since "mean" is  a 
#  built in function,  jackknife(x,mean) would be simpler!)
   x <- rnorm(20)               
   theta <- function(x){mean(x)}
                             
   results <- jackknife(x,theta)        
                              
# To jackknife functions of more  complex data structures, 
# write theta so that its argument x
#  is the set of observation numbers  
#  and simply  pass as data to jackknife the vector 1,2,..n. 
# For example, to jackknife
# the correlation coefficient from a set of 15 data pairs:      
                        
   xdata <- matrix(rnorm(30),ncol=2)
   n <- 15
   theta <- function(x,xdata){ cor(xdata[x,1],xdata[x,2]) }
   results <- jackknife(1:n,theta,xdata)



