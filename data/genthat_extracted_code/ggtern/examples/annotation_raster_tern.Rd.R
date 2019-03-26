library(ggtern)


### Name: annotation_raster_tern
### Title: Annotation: High-performance rectangular tiling (ggtern version)
### Aliases: annotation_raster_tern GeomRasterAnnTern
### Keywords: datasets

### ** Examples

data(Feldspar)
data(FeldsparRaster)
ggtern(Feldspar,aes(Ab,An,Or)) + 
theme_rgbw() + 
annotation_raster_tern(FeldsparRaster,xmin=0,xmax=1,ymin=0,ymax=1) +
geom_mask() + 
geom_point(size=5,aes(shape=Feldspar,fill=Feldspar),color='black') +
scale_shape_manual(values=c(21,24)) +
labs(title="Demonstration of Raster Annotation")



