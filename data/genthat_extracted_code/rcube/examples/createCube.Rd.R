library(rcube)


### Name: createCube
### Title: Creating cube size NxNxN
### Aliases: createCube

### ** Examples

# Create 3x3x3 cube with original color scheme:
cube <- createCube()
# Create 14x14x14 cube with original color scheme:
cube <- createCube(N = 14)
# Create 3x3x3 cube with "japanese" color scheme:
cube <- createCube(scheme = c("green","white","red","blue","orange","yellow"))
# Create 3x3x3 learning cubes:
c <- createCube(mode = "cross and centers")
c2 <- createCube(mode = "first layer and centers")
c3 <- createCube(mode = "first two layers")
# Create cube with coloured corners and edges:
c <- createCube(N = 4, mode = "corners and edges")



