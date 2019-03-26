library(circular)


### Name: totalvariation.circular
### Title: Conditional total variation distance between two circular
###   samples.
### Aliases: totalvariation.circular
### Keywords: univariate

### ** Examples

x <- rvonmises(100, circular(pi), 10)
y <- rvonmises(100, circular(pi+pi/8), 10)
res <- totalvariation.circular(x,y,bw=50)
plot(res)



