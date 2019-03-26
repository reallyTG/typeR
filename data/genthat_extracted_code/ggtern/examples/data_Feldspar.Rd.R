library(ggtern)


### Name: data_Feldspar
### Title: Elkin and Groves Feldspar Data
### Aliases: data_Feldspar Feldspar FeldsparRaster

### ** Examples

#Summarize the Feldspar Data
data(Feldspar)
summary(Feldspar)

#Plot Felspar Data
ggtern(data=Feldspar,aes(x=An,y=Ab,z=Or)) + 
    geom_point()

# Plot Feldspar data and Underlying Raster Image
data(FeldsparRaster)
ggtern(Feldspar,aes(Ab,An,Or)) + 
    theme_rgbw() + 
    annotation_raster_tern(FeldsparRaster,xmin=0,xmax=1,ymin=0,ymax=1) +
    geom_point(size=5,aes(shape=Feldspar,fill=Feldspar),color='black') +
    scale_shape_manual(values=c(21,24)) +
    labs(title = "Demonstration of Raster Annotation")
    



