library(ggforce)


### Name: geom_spiro
### Title: Draw spirograms based on the radii of the different "wheels"
###   involved
### Aliases: geom_spiro stat_spiro

### ** Examples

# Basic usage
ggplot() +
  geom_spiro(aes(R = 10, r = 3, d = 5))

# Only draw a portion
ggplot() +
  geom_spiro(aes(R = 10, r = 3, d = 5), revolutions = 1.2)

# Let the inner gear circle the outside of the outer gear
ggplot() +
  geom_spiro(aes(R = 10, r = 3, d = 5, outer = TRUE))



