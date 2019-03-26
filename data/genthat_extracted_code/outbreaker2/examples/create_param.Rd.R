library(outbreaker2)


### Name: create_param
### Title: Initializes outputs for outbreaker
### Aliases: create_param outbreaker_store

### ** Examples


## load data
x <- fake_outbreak
data <- outbreaker_data(dates = x$sample, dna = x$dna, w_dens = x$w)

## modify config settings
config <- create_config(move_alpha = FALSE, n_iter = 2e5, sample_every = 1000)

## create param object
param <- create_param(data = data, config = config)




