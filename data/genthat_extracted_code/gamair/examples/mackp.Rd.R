library(gamair)


### Name: mackp
### Title: Prediction grid data for 1992 mackerel egg model
### Aliases: mackp
### Keywords: data

### ** Examples

## example of how to use `area.index' to paste gridded info.
## into a square grid (of NA's) for plotting
data(mackp)
lon<-seq(-15,-1,1/4);lat<-seq(44,58,1/4)
zz<-array(NA,57*57)
zz[mackp$area.index]<-mackp$b.depth
image(lon,lat,matrix(zz,57,57))



