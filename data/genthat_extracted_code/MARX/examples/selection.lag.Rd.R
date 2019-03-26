library(MARX)


### Name: selection.lag
### Title: The model selection for pseudo-ARX function
### Aliases: selection.lag
### Keywords: pseudo-causal selection

### ** Examples

data <- sim.marx(c('t',1,1), c('t',1,1),100,0.5,0.4,0.3)
selection.lag(data$y,data$x,8)



