library(aspace)


### Name: calc_box
### Title: Calculate the Standard Deviation Box
### Aliases: calc_box
### Keywords: arith

### ** Examples

## BOX example
calc_box(id=1, filename="BOX_Output.txt", centre.xy=NULL, calccentre=TRUE, 
weighted=FALSE, weights=NULL, points=activities, verbose=FALSE)

## plot_box by default takes as input the result produced from the calc_box, read from the current workspace. 

## SD Box to shapefile example (exclude the comments below to run script)
## shp <- convert.to.shapefile(boxloc,boxatt,"id",5)
## write.shapefile(shp, "BOX_Shape", arcgis=T)



