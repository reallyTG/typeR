library(cptcity)


### Name: find_cpt
### Title: Function to return colour palettes names
### Aliases: find_cpt

### ** Examples

{
library(cptcity)
find_cpt("temperature")
image(matrix(1:100), col = cpt("idv_temperature"))
## Not run: 
##D library(cptcity)
##D # Do not run
##D # data names_cpt lazy loaded, already in environment
##D library(ggplot2)
##D ggplot(faithfuld, aes(waiting, eruptions)) +
##D geom_raster(aes(fill = density))
##D 
##D find_cpt("radar")
##D ggplot(faithfuld, aes(waiting, eruptions)) +
##D geom_raster(aes(fill = density)) +
##D scale_fill_gradientn(colours = cpt(n = 10, "ncl_radar"))
##D 
##D find_cpt("rain")
##D ggplot(faithfuld, aes(waiting, eruptions)) +
##D geom_raster(aes(fill = density)) +
##D scale_fill_gradientn(colours = cpt(pal = "pj_1_a_rainbow"))
## End(Not run)
}



