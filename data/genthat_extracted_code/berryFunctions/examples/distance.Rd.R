library(berryFunctions)


### Name: distance
### Title: Distance between points
### Aliases: distance
### Keywords: spatial

### ** Examples


A <- c(3,  9,-1)
B <- c(7, -2, 4)
plot(A,B)
text(A,B, paste0("P",1:3), adj=1.1)
points(3,5, col=2, pch=16)
segments(3,5, A,B)
distance(A,B, 3,5)
text(c(3.2,6,1), c(6,1,4), round(distance(A,B, 3,5),2) )




