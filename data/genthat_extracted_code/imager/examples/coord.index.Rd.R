library(imager)


### Name: coord.index
### Title: Coordinates from pixel index
### Aliases: coord.index

### ** Examples

cind <- coord.index(boats,33)
#Returns (x,y,z,c) coordinates of the 33rd pixel in the array
cind
all.equal(boats[33],with(cind,at(boats,x,y,z,cc)))
all.equal(33,index.coord(boats,cind))



