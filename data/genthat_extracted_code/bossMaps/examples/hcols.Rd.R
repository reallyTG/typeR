library(bossMaps)


### Name: hcols
### Title: Aesthetically pleasing color ramp for plotting habitat
###   suitability
### Aliases: hcols

### ** Examples

library(ggplot2)
data=cbind.data.frame(expand.grid(x=1:10,y=1:10),z=rnorm(100))
ggplot(data,aes(x=x,y=y,fill=z))+geom_raster()+
scale_fill_gradientn(colours=hcols(20,bias=2))



