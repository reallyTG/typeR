library(landscapetools)


### Name: util_facetplot
### Title: util_facetplot() for visual overview
### Aliases: util_facetplot

### ** Examples

## Not run: 
##D l1 <- NLMR::nlm_fbm(64, 64)
##D l2 <- NLMR::nlm_planargradient(64, 64)
##D l3 <- NLMR::nlm_randomrectangularcluster(ncol = 60, nrow = 60, minl = 5, maxl = 10)
##D l4 <- NLMR::nlm_random(64, 64)
##D 
##D bri1 <- raster::brick(l1, l2)
##D names(bri1) <- c("FBM", "GRADIENT")
##D util_facetplot(bri1)
##D 
##D lst1 <- list(layer1 = l1,
##D              layer2 = l2,
##D              layer3 = l3,
##D              layer4 = l4)
##D util_facetplot(lst1)
## End(Not run)




