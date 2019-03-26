library(maptools)


### Name: gcDestination
### Title: Find destination in geographical coordinates
### Aliases: gcDestination
### Keywords: spatial

### ** Examples

data(state)
res <- gcDestination(state.center$x, state.center$y, 45, 250, "km")
plot(state.center$x, state.center$y, asp=1, pch=16)
arrows(state.center$x, state.center$y, res[,1], res[,2], length=0.05)
llist <- vector(mode="list", length=length(state.center$x))
for (i in seq(along=llist)) llist[[i]] <- gcDestination(state.center$x[i],
  state.center$y[i], seq(0, 360, 5), 250, "km")
plot(state.center$x, state.center$y, asp=1, pch=3)
nll <- lapply(llist, lines)



