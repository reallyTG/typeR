library(SpatEntropy)


### Name: karlstrom
### Title: Karlstrom and Ceccato's entropy.
### Aliases: karlstrom

### ** Examples

#LATTICE DATA
data.lat=matrix(sample(c("a","b","c"), 100, replace=TRUE), nrow=10)
ccc=coords_pix(area=square(10), nrow=10, ncol=10)
partition=areapart(square(10), G=5, data.coords=ccc)
karlstrom(data.lat, partition$data.assign, category="a",
G.coords=partition$G.coords, neigh.dist=2)
plot_areapart(partition$data.assign, square(10), is.pointdata=FALSE,
add.data=TRUE, data.bin=TRUE, category="a",
data=data.lat, G.coords=partition$G.coords, main="")

#POINT DATA
data.pp=runifpoint(100, win=square(10))
marks(data.pp)=sample(c("a","b","c"), 100, replace=TRUE)
ccc=coords(data.pp)
partition=areapart(square(10), G=4, data.coords=ccc)
karlstrom(marks(data.pp), partition$data.assign,
category="b", G.coords=partition$G.coords, neigh.dist=4)
plot_areapart(partition$data.assign, square(10), is.pointdata=TRUE,
add.data=TRUE, data.bin=TRUE, category="b",
data=data.pp, G.coords=partition$G.coords, main="")




