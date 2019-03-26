library(binnednp)


### Name: bw.dens.binned
### Title: Bootstrap and plug-in bandwidth selectors for kernel density
###   estimation with binned data.
### Aliases: bw.dens.binned

### ** Examples

set.seed(1)
n <- 200 #complete sample size
k <- 30 #number of intervals
x <- rnorm(n,6,1) #complete sample
y <- seq(min(x)-0.2,max(x)+0.2,len=k+1) #intervals
w <- c(sapply(2:k,function(i)sum( x<y[i]&x>=y[i-1] )), sum(x<=y[k+1]&x>=y[k]) )/n #proportions
bw.dens.binned(n,y,w,plot=FALSE)




