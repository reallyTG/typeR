library(ggdistribute)


### Name: mejr_geom_defaults
### Title: Setup defaults for specific geoms
### Aliases: mejr_geom_defaults

### ** Examples

# This will change the point size and shape for
#  all geoms in which GeomPoint inherits from.
mejr_geom_defaults(cex = 1.1, pch = 19)

# Reset defaults back to their original state.
mejr_geom_defaults(reset=TRUE)



