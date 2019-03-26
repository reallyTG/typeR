library(fossil)


### Name: mstlines
### Title: Display a Minimum Spanning Tree or Network
### Aliases: mstlines
### Keywords: datagen

### ** Examples

#plot with overlain MST for fdata dataset
data(fdata.lats)
data(fdata.mat)
fdata.dist<-dino.dist(fdata.mat)
fdata.mst<-dino.mst(fdata.dist)
plot(coordinates(fdata.lats))
mstlines(fdata.mst, coordinates(fdata.lats))



