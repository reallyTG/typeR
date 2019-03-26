library(rcosmo)


### Name: geoDist
### Title: Geodesic distance on the unit sphere
### Aliases: geoDist

### ** Examples


p1 <- data.frame(diag(3))
colnames(p1) <- c("x", "y", "z")
p1
p2 <- data.frame(x=c(1,0), y=c(0,3/5), z=c(0,4/5))
p2
geoDist(p1, p2, include.names = FALSE)




