library(sperrorest)


### Name: get_small_tiles
### Title: Identify small partitions that need to be fixed.
### Aliases: get_small_tiles

### ** Examples

data(ecuador) # Muenchow et al. (2012), see ?ecuador
# Rectangular partitioning without removal of small tiles:
parti <- partition_tiles(ecuador, nsplit = c(10,10), reassign = FALSE)
summary(parti)
length(parti[[1]])
# Same in factor format for the application of get_small_tiles:
parti_fac <- partition_tiles(ecuador, nsplit = c(10, 10), reassign = FALSE,
                             return_factor = TRUE)
get_small_tiles(parti_fac[[1]], min_n = 20) # tiles with less than 20 samples
parti2 <- partition_tiles(ecuador, nsplit = c(10, 10), reassign = TRUE,
                          min_n = 20, min_frac = 0)
length(parti2[[1]]) # < length(parti[[1]])



