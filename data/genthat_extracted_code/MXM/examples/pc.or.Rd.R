library(MXM)


### Name: Orientation rules for the PC algorithm
### Title: The orientations part of the PC algorithm.
### Aliases: pc.or
### Keywords: PC algorithm

### ** Examples

# simulate a dataset with continuous data
y <- rdag2(2000, p = 20, nei = 3)
ind <- sample(1:20, 20)
tru <- y$G[ind, ind] 
x <- y$x[, ind]
mod <- pc.con(x)
mod$runtime

plotnetwork(tru) 

b <- pc.or(mod)
plotnetwork(b$G)

plotnetwork( dag2eg(tru) )  ## essential graph
plotnetwork(b$G)



