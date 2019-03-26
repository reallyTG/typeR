library(mapproj)


### Name: mapproject
### Title: Apply a Map Projection
### Aliases: mapproject
### Keywords: dplot

### ** Examples

library(maps)
# Bonne equal-area projection with state abbreviations
map("state",proj='bonne', param=45)
data(state)
text(mapproject(state.center), state.abb)

# this does not work because the default orientations are different:
map("state",proj='bonne', param=45)
text(mapproject(state.center,proj='bonne',param=45),state.abb)

map("state",proj="albers",par=c(30,40))
map("state",par=c(20,50)) # another Albers projection

map("world",proj="gnomonic",orient=c(0,-100,0)) # example of orient
# see map.grid for more examples

# tests of projections added RSB 091101
projlist <- c("aitoff", "albers", "azequalarea", "azequidist", "bicentric",
 "bonne", "conic", "cylequalarea", "cylindrical", "eisenlohr", "elliptic",
 "fisheye", "gall", "gilbert", "guyou", "harrison", "hex", "homing",
 "lagrange", "lambert", "laue", "lune", "mercator", "mollweide", "newyorker",
 "orthographic", "perspective", "polyconic", "rectangular", "simpleconic",
 "sinusoidal", "tetra", "trapezoidal")
x <- seq(-100, 0, 10)
y <- seq(-45, 45, 10)
xy <- expand.grid(x=x, y=y)
pf <- c(0, 2, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 2, 0, 1, 0, 2, 0, 2,
 0, 0, 1, 0, 1, 0, 1, 2, 0, 0, 2)
res <- vector(mode="list", length=length(projlist))
for (i in seq(along=projlist)) {
 if (pf[i] == 0) res[[i]] <- mapproject(xy$x, xy$y, projlist[i])
 else if (pf[i] == 1) res[[i]] <- mapproject(xy$x, xy$y, projlist[i], 0)
 else res[[i]] <- mapproject(xy$x, xy$y, projlist[i], c(0,0))
}
names(res) <- projlist
lapply(res, function(p) rbind(p$x, p$y))



