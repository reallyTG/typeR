library(MARX)


### Name: bic
### Title: The Bayesian/Schwarz information criterion (BIC) function
### Aliases: bic
### Keywords: selection

### ** Examples

data <- sim.marx(c('t',1,1), c('t',1,1),100,0.5,0.4,0.3)
bic(data$y, data$x,8)



