library(agricolae)


### Name: zigzag
### Title: order plot in serpentine
### Aliases: zigzag
### Keywords: manip

### ** Examples

library(agricolae)
trt<-letters[1:5]
r<-4
outdesign <- design.rcbd(trt,r,seed=9)
fieldbook <- zigzag(outdesign)



