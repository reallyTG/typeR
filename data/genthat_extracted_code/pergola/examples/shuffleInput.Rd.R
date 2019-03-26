library(pergola)


### Name: shuffleInput
### Title: Randomize marker order and alleles within samples In simulated
###   datasets, the order or markers and alleles within samples is often
###   given. To remove any prior knowledge, that would not be available,
###   the data should be randomized. Thus, the performance of our tool can
###   be validated unbiased.
### Aliases: shuffleInput

### ** Examples

data(simTetra)
shuffleInput(simTetra, 4)



