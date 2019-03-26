library(NLMR)


### Name: nlm_gaussianfield
### Title: nlm_gaussianfield
### Aliases: nlm_gaussianfield

### ** Examples

# simulate random gaussian field
gaussian_field <- nlm_gaussianfield(ncol = 90, nrow = 90,
                                    autocorr_range = 60,
                                    mag_var = 8,
                                    nug = 5)

## Not run: 
##D # visualize the NLM
##D landscapetools::show_landscape(gaussian_field)
## End(Not run)




