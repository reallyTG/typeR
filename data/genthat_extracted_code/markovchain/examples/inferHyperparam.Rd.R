library(markovchain)


### Name: inferHyperparam
### Title: Function to infer the hyperparameters for Bayesian inference
###   from an a priori matrix or a data set
### Aliases: inferHyperparam

### ** Examples

data(rain, package = "markovchain")
inferHyperparam(data = rain$rain)
 
weatherStates <- c("sunny", "cloudy", "rain")
weatherMatrix <- matrix(data = c(0.7, 0.2, 0.1, 
                                 0.3, 0.4, 0.3, 
                                 0.2, 0.4, 0.4), 
                        byrow = TRUE, nrow = 3, 
                        dimnames = list(weatherStates, weatherStates))
inferHyperparam(transMatr = weatherMatrix, scale = c(10, 10, 10))
 



