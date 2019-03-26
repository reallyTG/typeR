library(simglm)


### Name: rbimod
### Title: Simulating mixture normal distributions
### Aliases: rbimod

### ** Examples

## No test: 
## mix normal with two normal distributions (bimodal)
simData <- rbimod(100, mean = c(-2, 3), var = c(1.5, 1.5), num_dist = 2)
plot(density(simData))

## mixt normal with four distributions (multimodal)
simData <- rbimod(400, mean = c(-14, -4, 6, 20), var = c(rep(1.2, 4)), 
  num_dist = 4)
plot(density(simData))
## End(No test)



