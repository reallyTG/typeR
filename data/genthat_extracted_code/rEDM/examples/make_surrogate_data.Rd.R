library(rEDM)


### Name: make_surrogate_data
### Title: Generate surrogate data for permutation/randomization tests
### Aliases: make_surrogate_data make_surrogate_shuffle
###   make_surrogate_ebisuzaki make_surrogate_seasonal
###   make_surrogate_shuffle make_surrogate_ebisuzaki
###   make_surrogate_seasonal make_surrogate_twin

### ** Examples

data("two_species_model")
ts <- two_species_model$x[1:200]
make_surrogate_data(ts, method = "ebisuzaki")

make_surrogate_shuffle(rnorm(100), 10)

make_surrogate_ebisuzaki(rnorm(100), 10)

make_surrogate_seasonal(rnorm(100) + sin(1:100 * pi / 6), 10)

make_surrogate_twin(rnorm(100, sd = 0.1) + sin(1:100 * pi / 6), 10)




