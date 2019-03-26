library(splancs)


### Name: Ghat
### Title: G nearest neighbour distribution function
### Aliases: Ghat
### Keywords: spatial

### ** Examples

data(uganda)
plot(seq(20, 500, 20), Ghat(as.points(uganda), seq(20, 500, 20)), 
type="l", xlab="distance", ylab="Estimated G")



