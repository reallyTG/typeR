library(RNCEP)


### Name: NCEP.vis.area
### Title: Visualize Weather Data on a Map
### Aliases: NCEP.vis.area

### ** Examples

## Not run: 
##D library(RNCEP)
##D ## Retrieve data for a specified spatial and temporal extent ##
##D wx.extent <- NCEP.gather(variable = "air", level=850,
##D     months.minmax = 11, years.minmax = 2000,
##D     lat.southnorth = c(50, 60), lon.westeast = c(0, 10),
##D     reanalysis2 = FALSE, return.units = TRUE)
##D 
##D ## Visualize the first layer (i.e. first timestep) of the
##D ## variable on a map
##D ## Note how to specify the plot's title
##D ## Note also the adjustment of the Kernal span argument for 
##D ## 		interpolation using interp.loess.args
##D NCEP.vis.area(wx.data=wx.extent, layer=1, show.pts=TRUE, draw.contours=TRUE,
##D     cols=heat.colors(64), transparency=.6, title.args=list(main="Example"),
##D     interp.loess.args=list(span=.75))
##D 
##D ## Now visualize a particular layer by specifying its datetime ##
##D NCEP.vis.area(wx.data=wx.extent, layer='2000-11-01 18', show.pts=TRUE,
##D     draw.contours=TRUE, cols=terrain.colors(64), transparency=.6,
##D     title.args=list(main="Example: select layer by datetime"),
##D     interp.loess.args=list(span=0.5))
##D 	
##D ## Now produce the same graph as above ##
##D ## This time, label the color-bar legend ##
##D NCEP.vis.area(wx.data=wx.extent, layer='2000-11-01 18', show.pts=TRUE,
##D     draw.contours=TRUE, cols=terrain.colors(64), transparency=.6,
##D     title.args=list(main="Example: select layer by datetime"),
##D     interp.loess.args=list(span=0.5), 
##D     image.plot.args=list(legend.args=list(text='Kelvin', cex=1.15, padj=-1, adj=-.25)))
##D 
##D ## Now produce the same graph as above ##
##D ## This time, explicitly specify the size and location 
##D ## of the color-bar legend using the smallplot argument 
##D ## in the list of image.plot.args ##
##D NCEP.vis.area(wx.data=wx.extent, layer='2000-11-01 18', show.pts=TRUE,
##D     draw.contours=TRUE, cols=terrain.colors(64), transparency=.6,
##D     title.args=list(main="Example: select layer by datetime"),
##D     interp.loess.args=list(span=0.5), 
##D     image.plot.args=list(legend.args=list(text='Kelvin', cex=1.15, padj=-1, adj=-.25),
##D         smallplot=c(0.8475, 0.875, 0.20, 0.8)))
##D 
##D ###########################################################
##D ## This function can also show a layer after aggregation ##
##D ###########################################################
##D ## Calculate the average hourly temperature from the data
##D ## obtained above ##
##D wx.ag <- NCEP.aggregate(wx.data=wx.extent, YEARS=FALSE, MONTHS=FALSE,
##D     HOURS=TRUE, DAYS=FALSE, fxn='mean')
##D 
##D ## Now plot the mean temperature at midnight ##
##D ## Note the adjustment of axis labels
##D ## Note also the adjustment of the point type
##D NCEP.vis.area(wx=wx.ag, layer=1, interp.loess.args=list(span=0.5),
##D     title.args=list(main='Example: aggregated layer', xlab='Long [degrees]',
##D     ylab='Lat [degrees]'), points.args=list(pch=19))
##D 
##D ## Now produce the same plot as above ##
##D ## This time, change the font size used in the
##D ## contour labels ##
##D NCEP.vis.area(wx=wx.ag, layer=1, interp.loess.args=list(span=0.5),
##D     title.args=list(main='Example: aggregated layer', xlab='Long [degrees]',
##D     ylab='Lat [degrees]'), points.args=list(pch=19),
##D     contour.args=list(labcex=.6))
##D 	
##D ## Notice how you can plot an aggregated layer by specifying
##D ## it explicitly ##
##D NCEP.vis.area(wx=wx.ag, layer="XXXX-XX-XX 18", interp.loess.args=list(span=0.5),
##D     title.args=list(main='Example: aggregated layer', xlab='Long [degrees]',
##D     ylab='Lat [degrees]'), points.args=list(pch=19),
##D     contour.args=list(labcex=.6))
## End(Not run)



