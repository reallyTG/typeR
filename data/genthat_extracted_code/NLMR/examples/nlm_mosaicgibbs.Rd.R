library(NLMR)


### Name: nlm_mosaicgibbs
### Title: nlm_mosaicgibbs
### Aliases: nlm_mosaicgibbs

### ** Examples

# simulate polygonal landscapes
mosaicgibbs <- nlm_mosaicgibbs(ncol = 40,
                              nrow = 30,
                              germs = 20,
                              R = 0.02,
                              patch_classes = 12)

## Not run: 
##D # visualize the NLM
##D landscapetools::show_landscape(mosaicgibbs)
## End(Not run)




