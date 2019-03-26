library(lidR)


### Name: plot
### Title: Plot a LAS* object
### Aliases: plot plot,LAS,missing-method plot,LAScatalog,missing-method
###   plot,LASheader,missing-method

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las <- readLAS(LASfile)

plot(las, clear_artifact = TRUE)

# Outliers in intensity break the color range. Use the trim parameter.
col <- heat.colors(50)
plot(las, color = Intensity, colorPalette = col)
plot(las, color = Intensity, colorPalette = col, trim = 70)

## Not run: 
##D 
##D # single file catalog using data provided in lidR
##D ctg = catalog(LASfile)
##D plot(ctg)
## End(Not run)

## Not run: 
##D 
##D # single file catalog using data provided in lidR
##D ctg = catalog(LASfile)
##D plot(ctg)
## End(Not run)



