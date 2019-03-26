library(spatstat)


### Name: crossing.linnet
### Title: Crossing Points between Linear Network and Other Lines
### Aliases: crossing.linnet
### Keywords: spatial manip

### ** Examples

   plot(simplenet, main="")
   L <- infline(p=runif(3), theta=runif(3, max=pi/2))
   plot(L, col="red")
   Y <- crossing.linnet(simplenet, L)
   plot(Y, add=TRUE, cols="blue")



