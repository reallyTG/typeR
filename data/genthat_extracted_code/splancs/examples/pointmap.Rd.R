library(splancs)


### Name: pointmap
### Title: Graphics
### Aliases: pointmap
### Keywords: spatial

### ** Examples

data(bodmin)
plot(bodmin$poly, asp=1, type="n")
pointmap(as.points(bodmin), add=TRUE)
polymap(bodmin$poly, add=TRUE)



