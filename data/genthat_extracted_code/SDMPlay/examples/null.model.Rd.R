library(SDMPlay)


### Name: null.model
### Title: Compute null model
### Aliases: null.model

### ** Examples

## Not run: 
##D library(dismo)
##D #Download the environmental predictors restricted on geographical extent and depth (-1500m)
##D envi <-raster::stack(system.file('extdata', 'pred.grd',package='SDMPlay'))
##D 
##D # Realize a null model type #2 with BRT
##D #--------------------------------------
##D # NB: the following arguments chosen for the example are not relevant,
##D # in the scope to minimize running time
##D modelN2 <- SDMPlay:::null.model(xy=NULL,predictors=envi,type=2,algorithm='brt',
##D                      nb=300,unique.data=TRUE, same=TRUE, nb.rep=2,lr=0.005)
##D 
##D # Look at the inputs used to implement the model
##D modelN2$input
##D 
##D # Get the evaluation of the models produced
##D modelN2$eval
##D 
##D # Get the evaluation of the mean of all these produced models (i.e. evaluation
##D # of the null model )
##D modelN2$eval.null
##D 
##D # Get the values of Spearman correlations between the all the prediction maps produced
##D modelN2$correlation
##D 
##D # Plot the mean null model map with nice colors
##D library(grDevices)
##D palet.col <- colorRampPalette(c('deepskyblue','green','yellow', 'red'))(80)
##D raster::plot(modelN2$pred.mean, col=palet.col)
## End(Not run)



