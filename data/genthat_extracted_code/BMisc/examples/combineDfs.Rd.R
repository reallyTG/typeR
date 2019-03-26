library(BMisc)


### Name: combineDfs
### Title: combineDfs
### Aliases: combineDfs

### ** Examples

x <- rnorm(100)
y <- rnorm(100,1,1)
Fx <- ecdf(x)
Fy <- ecdf(y)
both <- combineDfs(seq(-2,3,0.1), list(Fx,Fy))
plot(Fx, col="green")
plot(Fy, col="blue", add=TRUE)
plot(both, add=TRUE)




