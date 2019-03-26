library(agricolae)


### Name: design.crd
### Title: Completely Randomized Design
### Aliases: design.crd
### Keywords: design

### ** Examples

library(agricolae)
trt <-c("CIP-101","CIP-201","CIP-301","CIP-401","CIP-501")
r <-c(4,3,5,4,3)
# seed = 12543
outdesign1 <-design.crd(trt,r,serie=2,2543,"Mersenne-Twister")
book1<-outdesign1
# no seed
outdesign2 <-design.crd(trt,r,serie=3)
print(outdesign2$parameters)
book2<-outdesign2
# write to hard disk
# write.table(book1,"crd.txt", row.names=FALSE, sep="\t")
# file.show("crd.txt")



