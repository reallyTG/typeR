library(bootstrap)


### Name: bcanon
### Title: Nonparametric BCa Confidence Limits
### Aliases: bcanon
### Keywords: nonparametric

### ** Examples

#  bca limits for the  mean 
#  (this is for illustration; 
#   since "mean" is a built in function,
#   bcanon(x,100,mean) would be simpler!)
   x <- rnorm(20)                
   theta <- function(x){mean(x)}
   results <- bcanon(x,100,theta)   
                              
# To obtain bca limits for functions of more 
# complex data structures, write theta
# so that its argument x is the set of observation
# numbers and simply pass as data to bcanon 
# the vector 1,2,..n. 
# For example, find bca limits for
# the correlation coefficient from a set of 15 data pairs:
   xdata <- matrix(rnorm(30),ncol=2)
   n <- 15
   theta <- function(x,xdata){ cor(xdata[x,1],xdata[x,2]) }
   results <- bcanon(1:n,100,theta,xdata)



