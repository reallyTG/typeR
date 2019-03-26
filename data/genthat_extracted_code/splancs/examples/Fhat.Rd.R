library(splancs)


### Name: Fhat
### Title: F nearest neighbour distribution function
### Aliases: Fhat
### Keywords: spatial

### ** Examples

data(uganda)
plot(seq(20, 500, 20), Fhat(as.points(uganda), 
as.points(csr(uganda$poly, length(uganda$x))), seq(20, 500, 20)), 
type="l", xlab="distance", ylab="Estimated F")
plot(Ghat(as.points(uganda), seq(20, 500, 20)), Fhat(as.points(uganda), 
as.points(csr(uganda$poly, length(uganda$x))), seq(20, 500, 20)), 
type="l", xlab="Estimated G", ylab="Estimated F")
lines(c(0,1),c(0,1),lty=2)



