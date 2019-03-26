library(sharpshootR)


### Name: diagnosticPropertyPlot
### Title: Diagnostic Property Plot
### Aliases: diagnosticPropertyPlot diagnosticPropertyPlot2
### Keywords: hplots

### ** Examples

## Not run: 
##D library(aqp)
##D 
##D # sample data, an SPC
##D data(gopheridge, package='soilDB')
##D 
##D # get depth class
##D sdc <- getSoilDepthClass(gopheridge)
##D site(gopheridge) <- sdc
##D 
##D # diagnostic properties to consider, no need to convert to factors
##D v <- c('lithic.contact', 'paralithic.contact', 'argillic.horizon', 
##D 'cambic.horizon', 'ochric.epipedon', 'mollic.epipedon', 'very.shallow',
##D 'shallow', 'mod.deep', 'deep', 'very.deep')
##D 
##D # base graphics
##D x <- diagnosticPropertyPlot(gopheridge, v, k=5)
##D 
##D # lattice graphics
##D x <- diagnosticPropertyPlot2(gopheridge, v, k=3)
##D 
##D # check output
##D str(x)
## End(Not run)



