library(VBLPCM)


### Name: fruchterman_reingold
### Title: Perform Fruchterman-Reingold layout of a network in 2 or more
###   dimensions.
### Aliases: fruchterman_reingold

### ** Examples

### 2D example
### load the aids blogs dataset
data(aids)
### perform the Fruchterman-Reingold layout
X<-fruchterman_reingold(aids.net, D=2, steps=1e3)
### plot the results
plot(X)

### 3D example
### load the aids blogs dataset
data(aids)
### perform the Fruchterman-Reingold layout
X<-fruchterman_reingold(aids.net, D=3, steps=1e3)
### Not run
### plot the results in 3D
# library(rgl)
# plot3d(X)



