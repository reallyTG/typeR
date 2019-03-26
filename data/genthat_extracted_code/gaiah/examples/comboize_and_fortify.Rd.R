library(gaiah)


### Name: comboize_and_fortify
### Title: prepare fortified output for multipanel plot
### Aliases: comboize_and_fortify

### ** Examples

# run through the example for comboize to get the variables
# mgen, miso, and mhab that we will use.
example(comboize)

# then run that on the first bird to get a data frame
# that you can use with ggplot
ff <- comboize_and_fortify(mgen[[1]], miso[[1]], mhab)

# this can be plotted with ggplot2
## Not run: 
##D library(ggplot2)
##D wmap <- get_wrld_simpl()
##D ggplot(mapping = aes(x=long, y = lat)) +
##D   coord_fixed(1.3, xlim = c(-170, -50), ylim = c(33, 70)) +
##D   geom_polygon(data = wmap, aes(group = group), fill = NA, color = "black", size = .05) +
##D   geom_raster(data = ff, mapping = aes(fill = prob), interpolate = TRUE) +
##D   scale_fill_gradientn(colours = c("#EBEBEB", rainbow(7)), na.value = NA) +
##D   theme_bw() +
##D   facet_wrap( ~ beta_vals, ncol = 2) +
##D   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
## End(Not run)




