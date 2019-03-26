library(aspace)


### Name: calc_sde
### Title: Calculate the Standard Deviation Ellipse
### Aliases: calc_sde
### Keywords: arith

### ** Examples

## SDE example
calc_sde(id=1, filename="SDE_Output.txt", centre.xy=NULL, calccentre=TRUE, 
weighted=FALSE, weights=NULL, points=activities, verbose=FALSE)

## plot_sde by default takes as input the result produced from the calc_sde, read from the current workspace. 

## SDE to shapefile example (exclude the comments below to run script)
## shp <- convert.to.shapefile(sdeloc,sdeatt,"id",5)
## write.shapefile(shp, "SDE_Shape", arcgis=T)



