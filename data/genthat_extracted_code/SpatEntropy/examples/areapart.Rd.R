library(SpatEntropy)


### Name: areapart
### Title: Area partition.
### Aliases: areapart

### ** Examples

#LATTICE DATA
#random generation of areas
ccc=coords_pix(area=square(10), nrow=10, ncol=10)
partition=areapart(square(10), G=5, data.coords=ccc)

#providing a pre-fixed area partition
win=square(10)
G=5
GG=cbind(runif(G, win$xrange[1], win$xrange[2]),
         runif(G, win$yrange[1], win$yrange[2]))
ccc=coords_pix(area=win, pixel.xsize = 2, pixel.ysize = 2)
partition=areapart(win, G=GG, data.coords=ccc)

#POINT DATA
#random generation of areas
data.pp=runifpoint(100, win=square(10))
marks(data.pp)=sample(c("a","b","c"), 100, replace=TRUE)
ccc=coords(data.pp)
partition=areapart(square(10), G=4, data.coords=ccc)

#providing a pre-fixed area partition
win=square(10)
G=4
GG=cbind(runif(G, win$xrange[1], win$xrange[2]),
         runif(G, win$yrange[1], win$yrange[2]))
data.pp=runifpoint(100, win=win)
marks(data.pp)=sample(c("a","b","c"), 100, replace=TRUE)
ccc=coords(data.pp)
partition=areapart(win, G=GG, data.coords=ccc)

#for plotting the area partiton
?plot_areapart




