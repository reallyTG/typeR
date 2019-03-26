library(TED)


### Name: noiseTests
### Title: Perform noise tests for a time series
### Aliases: noiseTests

### ** Examples

set.seed(123)
n=128
types=c('box','rc','cr','sine')
shapes=matrix(NA,20,n)
for (i in 1:20){
  shapes[i,]=cbfs(type=types[sample(1:4,1)])
}
whitenoise=ts2mat(rnorm(128*20),128)
# generate x which randomly combine the four types of events with each two of them
# separated by noise
x=c(t(cbind(shapes,whitenoise)))
plot(x,ty='l')
w=128
# execute loops sequentially
## Not run: 
##D tests=noiseTests(x,w,'white',parallel=FALSE)
## End(Not run)
# execute loops in parallel using doMC package (for non-Windows users)
## Not run: 
##D tests=noiseTests(x,w,'white',parallel=TRUE)
## End(Not run)



