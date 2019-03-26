library(TSrepr)


### Name: denorm_z
### Title: Z-score denormalisation
### Aliases: denorm_z

### ** Examples

# Normalise values and save normalisation parameters:
norm_res <- norm_z_list(rnorm(50, 5, 2))
# Denormalise new data with previous computed parameters:
denorm_z(rnorm(50, 4, 2), mean = norm_res$mean, sd = norm_res$sd)




