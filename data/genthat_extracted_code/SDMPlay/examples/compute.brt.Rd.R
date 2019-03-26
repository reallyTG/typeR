library(SDMPlay)


### Name: compute.brt
### Title: Compute BRT (Boosted Regression Trees) model
### Aliases: compute.brt

### ** Examples

## Not run: 
##D #Download the presence data
##D data('ctenocidaris.nutrix')
##D occ <- ctenocidaris.nutrix
##D # select longitude and latitude coordinates among all the information
##D occ <- ctenocidaris.nutrix[,c('decimal.Longitude','decimal.Latitude')]
##D 
##D #Download an example of environmental predictors
##D #restricted on geographical extent and depth (-1500m)
##D envi <- raster::stack(system.file('extdata', 'pred.grd',package='SDMPlay'))
##D envi
##D 
##D #Open SDMtab matrix
##D x <- system.file(file='extdata/SDMdata1500.csv',package='SDMPlay')
##D SDMdata <- read.table(x,header=TRUE, sep=';')
##D 
##D #Run the model
##D model <- SDMPlay:::compute.brt (x=SDMdata, proj.predictors=envi,lr=0.0005)
##D 
##D #Plot the partial dependance plots
##D dismo::gbm.plot(model$response)
##D 
##D #Get the contribution of each variable for the model
##D model$response$contributions
##D 
##D #Get the interaction between variables
##D dismo::gbm.interactions(model$response)
##D #Plot the interactions
##D int <- dismo::gbm.interactions(model$response)
##D # choose the interaction to plot
##D dismo::gbm.perspec(model$response,int$rank.list[1,1],int$rank.list[1,3])
##D 
##D #Plot the map prediction
##D library(grDevices) # add nice colors
##D palet.col <- colorRampPalette(c('deepskyblue','green','yellow', 'red'))( 80 )
##D raster::plot(model$raster.prediction, col=palet.col)
##D #add data
##D points(occ, col='black',pch=16)
## End(Not run)



