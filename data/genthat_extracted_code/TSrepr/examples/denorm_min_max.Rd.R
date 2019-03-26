library(TSrepr)


### Name: denorm_min_max
### Title: Min-Max denormalisation
### Aliases: denorm_min_max

### ** Examples

# Normalise values and save normalisation parameters:
norm_res <- norm_min_max_list(rnorm(50, 5, 2))
# Denormalise new data with previous computed parameters:
denorm_min_max(rnorm(50, 4, 2), min = norm_res$min, max = norm_res$max)




