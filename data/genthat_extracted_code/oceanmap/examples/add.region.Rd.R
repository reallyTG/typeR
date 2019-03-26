library(oceanmap)


### Name: add.region
### Title: adding a region to the region_definitions file
### Aliases: add.region
### Keywords: region_definitions

### ** Examples


## Example 1: Add region by supplying a one-row data.frame 
##            that holds the entire required information
# data(region_definitions) # load region_definitions
# lion <- region_definitions[region_definitions$label == 'lion',] # selecting Gulf of Lions region
# lion
# junk <- lion 
# junk$label <- 'junk' # rename region label
# add.region(junk) # add junk region
# data(region_definitions) # reload region_definitions
# region_definitions[,1:9]

## Example 2: Delete region
#delete.region("junk") # delete junk region
#data(region_definitions) # reload region_definitions
#region_definitions[,1:9]

## Example 3: Add region by supplying an extent- or raster-object and running the widget
library(raster)

ext <- extent(0,10,50,60)
plotmap(ext)
#add.region(ext) # extent-object

r <- raster(ext)
#add.region(r) # raster-object

## Example 4: Add region by supplying raster-object, colorbar positions and running the widget
#add.region(r,cbx=c(5,9.5),cby=c(51.7,52.4))

## Example 5: Add region by running the widget
#add.region()

## Example 6: Add region by running the widget
#add.region(add.px=list(label="lion",nrow=10,ncol=10))
#data(region_definitions)
#region_definitions[region_definitions$label =="lion",]

## Example 7: Creating a backup
#add.region(backup=T)
#add.region(backup=T, backup.folder=".",backup.regions=c("lion","medw4"))

## Example 8: Restoring the backup of the original region_definitions file
#add.region(restore=T)



