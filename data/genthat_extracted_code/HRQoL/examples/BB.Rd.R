library(HRQoL)


### Name: BB
### Title: The Beta-Binomial Distribution
### Aliases: dBB rBB
### Keywords: stats

### ** Examples

set.seed(12)
# We define
m <- 10     
p <- 0.4    
phi <- 1.8  

# We perform k beta-binomial simulations for those parameters.
k <- 100
bb <- rBB(k,m,p,phi)
bb
dd <- dBB(m,p,phi)

# We are going to plot the histogram of the created variable,
# and using dBB() function we are going to fit the distribution:
hist(bb,col="grey",breaks=seq(-0.5,m+0.5,1),probability=TRUE,
  main="Histogram",xlab="Beta-binomial random variable")
lines(seq(0,m),dd,col="red",lwd=4)




