library(NLMR)


### Name: nlm_mosaicfield
### Title: nlm_mosaicfield
### Aliases: nlm_mosaicfield

### ** Examples


# simulate mosaic random field
mosaic_field <- nlm_mosaicfield(ncol = 100,
                                nrow = 200,
                                n = NA,
                                infinit = TRUE,
                                collect = FALSE)
## Not run: 
##D # visualize the NLM
##D landscapetools::show_landscape(mosaic_field)
## End(Not run)




