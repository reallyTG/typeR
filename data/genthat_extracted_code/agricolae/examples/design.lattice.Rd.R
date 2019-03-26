library(agricolae)


### Name: design.lattice
### Title: Lattice designs
### Aliases: design.lattice
### Keywords: design

### ** Examples

library(agricolae)
# triple lattice
trt<-LETTERS[1:9]
outdesign<-design.lattice(trt,r=3,serie=2) # triple lattice design ( 9 trt)
# simple lattice
trt<-1:100
outdesign<-design.lattice(trt,r=2,serie=3) # simple lattice design, 10x10 



