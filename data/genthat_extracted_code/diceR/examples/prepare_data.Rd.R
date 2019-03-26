library(diceR)


### Name: prepare_data
### Title: Prepare data for consensus clustering
### Aliases: prepare_data

### ** Examples

set.seed(2)
x <- replicate(10, rnorm(100))
x.prep <- prepare_data(x)
dim(x)
dim(x.prep)



