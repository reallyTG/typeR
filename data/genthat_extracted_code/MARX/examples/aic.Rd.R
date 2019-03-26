library(MARX)


### Name: aic
### Title: The Akaike information criterion (AIC) function
### Aliases: aic
### Keywords: selection

### ** Examples

data <- sim.marx(c('t',1,1), c('t',1,1),100,0.5,0.4,0.3)
aic(data$y, data$x,8)



