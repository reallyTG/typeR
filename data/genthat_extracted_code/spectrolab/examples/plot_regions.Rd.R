library(spectrolab)


### Name: plot_regions
### Title: Plot polygons for spectral regions
### Aliases: plot_regions

### ** Examples

library(spectrolab)
spec = as.spectra(spec_matrix_example, name_idx = 1)
plot_regions(spec, default_spec_regions())
plot(spec, add = TRUE)

# Alternatively, if you want to get fancy...
## Not run: 
##D col_fun = colorRampPalette(c(rgb(1, 1, 0, 0.7),rgb(1, 0, 0, 0.7)), alpha = TRUE)
##D colors = col_fun(4)
##D 
##D plot_regions(spec,default_spec_regions(), col = colors)
##D plot(spec, add = TRUE)
## End(Not run)



