library(pvar)


### Name: ChangePoints
### Title: Change Points of a 'numeric' vector
### Aliases: ChangePoints

### ** Examples

x <- rwiener(100)
cid <- ChangePoints(x)
plot(x, type="l")
points(time(x)[cid], x[cid], cex=0.5, col=2, pch=19)



