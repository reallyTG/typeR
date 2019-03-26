library(TestFunctions)


### Name: add_noise
### Title: add_noise: Adds noise to any function
### Aliases: add_noise

### ** Examples

tf <- add_noise(function(x)sin(2*x*pi));curve(tf)
tf <- add_noise(function(x)sin(2*x*pi), noise=.1);curve(tf)



