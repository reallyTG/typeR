library(DSsim)


### Name: make.design
### Title: Creates a Survey.Design object
### Aliases: make.design

### ** Examples

# DSsim can generate a systematic set of parallel line transects which by default have a 
# spacing of 100
design <- make.design("line")

# The easiest way to generate the transect is by creating a simulation (default simulations 
#create a line transect design)
sim <- make.simulation()
transects <- generate.transects(sim)
plot(make.region())
plot(transects, col = 4, lwd = 2)

# DSsim can generate a systematic grid of point transects which by default have a spacing of 100
design <- make.design("point")

sim <- make.simulation(design.obj = design)
transects <- generate.transects(sim)
plot(make.region())
plot(transects)

# More complex designs can be defined in Distance for Windows. This software can then generate
# multiple survey instances and store them as shapefiles for use by DSsim. The shapefile below 
# was generated in this way.

## Not run: 
##D 
##D coords <- gaps <- list()
##D coords[[1]] <- list(data.frame(x = c(0,1000,1000,0,0), y = c(0,0,
##D  1000,1000,0)))
##D gaps[[1]] <- list(data.frame(x = c(400,600,500,350,400), y = c(100,
##D  250,600,120,100)))
##D region <- make.region(region.name = "study.area", units = "m", 
##D  coords = coords, gaps = gaps)
##D  
##D data(transects.shp)
##D #Edit the pathway below to point to an empty folder where the
##D #transect shapefile will be saved
##D shapefile.pathway <- "C:/..."
##D library(shapefiles)
##D write.shapefile(transects.shp, paste(shapefile.pathway,"/transects_1",
##D  sep = ""))
##D 
##D # This design was created in Distance for Windows in a region with the same dimensions as the
##D # deault make.region().
##D parallel.design <- make.design(transect.type = "Line", 
##D  design.details = c("Parallel","Systematic"), region = region, 
##D  design.axis = 0, spacing = 100, plus.sampling =FALSE, 
##D  path = shapefile.pathway)
##D 
##D # As there is only one set of transects we have to set single.transect.set = TRUE
##D sim <- make.simulation(single.transect.set = TRUE, design.obj = parallel.design)
##D transects <- generate.transects(sim)
##D plot(region)
##D plot(transects, col = 4, lwd = 2)
## End(Not run)



