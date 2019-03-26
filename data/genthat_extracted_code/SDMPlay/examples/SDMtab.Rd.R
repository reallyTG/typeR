library(SDMPlay)


### Name: SDMtab
### Title: Compile species distribution dataset for modelling
### Aliases: SDMtab

### ** Examples

#Open occurrence data
data('ctenocidaris.nutrix')
occ <- ctenocidaris.nutrix

#Open environmental descriptors RasterStack
r <- raster:: stack(system.file('extdata', 'pred.grd',package='SDMPlay'))

#create the dataframe for modelling
z <- SDMPlay:::SDMtab(xydata=occ[,c('decimal.Longitude','decimal.Latitude')],predictors=r)
head(z)




