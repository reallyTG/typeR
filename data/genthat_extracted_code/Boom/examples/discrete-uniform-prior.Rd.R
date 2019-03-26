library(Boom)


### Name: discrete-uniform-prior
### Title: Discrete prior distributions
### Aliases: DiscreteUniformPrior PointMassPrior PoissonPrior

### ** Examples


## Specify an exact number of trees in a Bart model (see the BoomBart
## package).

ntrees <- PointMassPrior(200)

## Uniform prior between 50 and 100 trees, including the endpoints.
ntrees <- DiscreteUniformPrior(50, 100)

## Truncated Poisson prior, with a mean of 20, a lower endpoint of 1,
## and an upper endpoint of 50.
ntrees <- PoissonPrior(20, 1, 50)




