library(aspace)


### Name: calc_sdd
### Title: Calculate the Standard Distance Deviation (Standard Distance)
### Aliases: calc_sdd
### Keywords: arith

### ** Examples

## SDD example
calc_sdd(id=1, filename="SDD_Output.txt", centre.xy=NULL, calccentre=TRUE, 
weighted=FALSE, weights=NULL, points=activities, verbose=FALSE)

## plot_sdd by default takes as input the result produced from the calc_sdd, read from the current workspace. 

## SDD to shapefile example (exclude the comments below to run script)
## shp <- convert.to.shapefile(sddloc,sddatt,"id",5)
## write.shapefile(shp, "SDD_Shape", arcgis=T)



