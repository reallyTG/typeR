library(sets)


### Name: fuzzyfuns
### Title: Fuzzy membership functions
### Aliases: charfun_generator is.charfun_generator fuzzy_tuple
###   fuzzy_normal fuzzy_two_normals fuzzy_bell fuzzy_cone fuzzy_sigmoid
###   fuzzy_trapezoid fuzzy_triangular fuzzy_pi3 fuzzy_pi4
###   fuzzy_normal_gset fuzzy_two_normals_gset fuzzy_bell_gset
###   fuzzy_sigmoid_gset fuzzy_trapezoid_gset fuzzy_triangular_gset
###   fuzzy_cone_gset fuzzy_pi3_gset fuzzy_pi4_gset
### Keywords: math

### ** Examples

## creating a fuzzy normal function
N <- fuzzy_normal(mean = 0, sd = 1)
N(-3:3)

## create a fuzzy set with it
gset(charfun = N, universe = -3:3)

## same using wrapper
fuzzy_normal_gset(universe = -3:3)

## creating a user-defined fuzzy function
fuzzy_poisson <- charfun_generator(dpois)
gset(charfun = fuzzy_poisson(10), universe = seq(0, 20, 2))

## creating a series of fuzzy normal sets
fuzzy_tuple(fuzzy_normal, 5)

## creating a series of fuzzy cones with specific locations
fuzzy_tuple(fuzzy_cone, c(2,3,7))



