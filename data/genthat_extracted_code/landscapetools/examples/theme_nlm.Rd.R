library(landscapetools)


### Name: theme_nlm
### Title: theme_nlm
### Aliases: theme_nlm theme_nlm_discrete theme_nlm_grey
###   theme_nlm_grey_discrete theme_facetplot

### ** Examples

# nolint start
## Not run: 
##D # provided example map
##D x <- fbmmap
##D # classify
##D y <- c(0.5, 0.15, 0.25)
##D y <- util_classify(x, y, c("1", "2", "3"))
##D 
##D # color + continuous
##D rasterVis::gplot(x) +
##D   ggplot2::geom_tile(ggplot2::aes(fill = value)) +
##D   ggplot2::labs(x = "Easting",
##D                 y = "Northing") +
##D   theme_nlm() +
##D   ggplot2::ggtitle("Example map",
##D                    subtitle = "with continuous viridis color scale") +
##D   ggplot2::labs(caption = "Example map simulated with the R package NLMR.")
##D 
##D # grey + continuous
##D rasterVis::gplot(x) +
##D   ggplot2::geom_tile(ggplot2::aes(fill = value)) +
##D   ggplot2::labs(x = "Easting",
##D                 y = "Northing") +
##D   theme_nlm_grey() +
##D   ggplot2::ggtitle("Example map",
##D                    subtitle = "with continuous grey color scale") +
##D   ggplot2::labs(caption = "Example map simulated with the R package NLMR.")
##D 
##D # color + discrete
##D rasterVis::gplot(y) +
##D   ggplot2::geom_tile(ggplot2::aes(fill = factor(value))) +
##D   ggplot2::labs(x = "Easting",
##D                 y = "Northing") +
##D   theme_nlm_discrete() +
##D   ggplot2::ggtitle("Example map",
##D                    subtitle = "with discrete viridis color scale") +
##D   ggplot2::labs(caption = "Random map simulated with the R package NLMR.")
##D 
##D # grey + discrete
##D rasterVis::gplot(y) +
##D   ggplot2::geom_tile(ggplot2::aes(fill = factor(value))) +
##D   ggplot2::labs(x = "Easting",
##D                 y = "Northing") +
##D   theme_nlm_grey_discrete() +
##D   ggplot2::ggtitle("Example map",
##D                    subtitle = "with discrete grey color scale") +
##D   ggplot2::labs(caption = "Random map simulated with the R package NLMR.")
##D 
##D # have a look at theme_facetplot
##D binary_maps <- util_binarize(x, c(0.3, 0.5, 0.7, 0.9))
##D util_facetplot(binary_maps)
##D 
##D # nolint end
## End(Not run)




