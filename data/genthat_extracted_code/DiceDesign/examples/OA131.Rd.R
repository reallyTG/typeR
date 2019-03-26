library(DiceDesign)


### Name: OA131
### Title: A 3D orthogonal array of strength 2
### Aliases: OA131
### Keywords: datasets

### ** Examples

data(OA131)

# centering and reducing to [0,1]^3
OA <- (OA131 + 0.5)/7

pairs(OA, xlim=c(0,1), ylim=c(0,1))
## Not run: 
##D library(lattice)
##D cloud(x3~x1+x2, data=OA, xlim=c(0,1), ylim=c(0,1), zlim=c(0,1), 
##D     screen = list(z = 50, x = -70, y = 0))
## End(Not run)



