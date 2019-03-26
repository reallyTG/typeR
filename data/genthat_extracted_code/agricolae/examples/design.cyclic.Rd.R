library(agricolae)


### Name: design.cyclic
### Title: Cyclic designs
### Aliases: design.cyclic
### Keywords: design

### ** Examples

library(agricolae)
trt<-letters[1:8]
# block size = 2, replication = 6
outdesign1 <- design.cyclic(trt,k=2, r=6,serie=2)
names(outdesign1)
# groups 1,2,3
outdesign1$sketch[[1]]
outdesign1$sketch[[2]]
outdesign1$sketch[[3]]
outdesign1$book
# row-column design
outdesign2<- design.cyclic(trt,k=2, r=6, serie=2, rowcol=TRUE)
outdesign2$sketch



