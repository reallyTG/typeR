library(splancs)


### Name: Fzero
### Title: Theoretical nearest neighbour distribution function
### Aliases: Fzero
### Keywords: spatial

### ** Examples

data(uganda)
plot(Ghat(as.points(uganda), seq(20, 500, 20)), Fzero(pdense(as.points(uganda), 
uganda$poly), seq(20, 500, 20)), type="l", ylab="Theoretical G", 
xlab="Estimated G")
lines(c(0,1),c(0,1),lty=2)



