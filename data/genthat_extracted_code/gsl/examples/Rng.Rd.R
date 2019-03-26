library(gsl)


### Name: Rng
### Title: Random numbers generation
### Aliases: Rng rng rng_alloc rng_clone rng_max rng_min rng_name rng_set
###   rng_get rng_uniform rng_uniform_int rng_uniform_pos
### Keywords: datagen distribution

### ** Examples

r <- rng_alloc("cmrg")
rng_set(r, 100)
rng_uniform(r, 10)



