library(RFOC)


### Name: makeblock3D
### Title: Make a 3D block Structure
### Aliases: makeblock3D
### Keywords: misc

### ** Examples

  block1 = matrix(c(0,0,0,
      1,0,0,
      1,0.5,0,
      0,0.5,0,
      0,0,-2,
      1,0,-2,
      1,0.5,-2,
      0,0.5,-2), byrow=TRUE, ncol=3)

    Bblock1 = makeblock3D(block1)




