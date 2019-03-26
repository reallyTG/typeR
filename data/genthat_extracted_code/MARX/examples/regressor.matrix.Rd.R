library(MARX)


### Name: regressor.matrix
### Title: The regressor matrix function
### Aliases: regressor.matrix
### Keywords: estimation

### ** Examples

data <- sim.marx(c('t',3,1),c('t',1,1),100,0.5,0.4,0.3)
regressor.matrix(data$y, data$x, 2)



