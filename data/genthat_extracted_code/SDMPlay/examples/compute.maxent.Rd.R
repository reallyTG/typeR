library(SDMPlay)


### Name: compute.maxent
### Title: Compute MaxEnt model
### Aliases: compute.maxent

### ** Examples

#Download the presence data
data('ctenocidaris.nutrix')
occ <- ctenocidaris.nutrix
# select longitude and latitude coordinates among all the information
occ <- ctenocidaris.nutrix[,c('decimal.Longitude','decimal.Latitude')]

#Download an example of environmental predictors
#restricted on geographical extent and depth (-1500m)
envi <- raster::stack(system.file('extdata', 'pred.grd',package='SDMPlay'))
envi

#Open SDMtab matrix
x <- system.file(file='extdata/SDMdata1500.csv',package='SDMPlay')
SDMdata <- read.table(x,header=TRUE, sep=';')

#only run if the maxent.jar file is available, in the right folder
jar <- paste(system.file(package="dismo"), "/java/maxent.jar", sep='')
# checking if maxent can be run (normally not part of your script)
if (file.exists(jar) & require(rJava)) {

# Run the model
model <- SDMPlay:::compute.maxent(x=SDMdata , proj.predictors=envi)

# Plot the map prediction
library(grDevices) # add nice colors
palet.col <- colorRampPalette(c('deepskyblue','green','yellow','red'))(80)
#'raster::plot(model$raster.prediction, col=palet.col)
# add data
points(occ, col='black',pch=16)

# Get the partial dependance curves
dismo::response(model$response)

# Get the percentage of contribution of each variable to the model
#plot(model$response)

# Get all the information provided by the model on a html document
model$response
}



