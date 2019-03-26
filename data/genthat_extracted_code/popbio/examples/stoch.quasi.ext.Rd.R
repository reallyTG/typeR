library(popbio)


### Name: stoch.quasi.ext
### Title: Calculate quasi-extinction threshold
### Aliases: stoch.quasi.ext
### Keywords: survey

### ** Examples

data(hudsonia)
n <- c(4264, 3,30,16,25,5)
names(n)<-c("seed",  "seedlings", "tiny", "small", "medium" , "large")
## exclude seeds using sumweight.  Using 100 nreps for speed
x <- stoch.quasi.ext(hudsonia, n, Nx=10, nreps=100, sumweight=c(0,1,1,1,1,1))
matplot(x, xlab="Years", ylab="Quasi-extinction probability", 
 type='l', lty=1, col=rainbow(10), las=1,
 main="Time to reach a quasi-extinction threshold 
of 10 above-ground individuals")



