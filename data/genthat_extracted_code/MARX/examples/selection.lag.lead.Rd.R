library(MARX)


### Name: selection.lag.lead
### Title: The lag-lead model selection for MARX function
### Aliases: selection.lag.lead
### Keywords: causal-noncausal selection

### ** Examples

data <- sim.marx(c('t',3,1), c('t',3,1),100,0.5,0.4,0.3)
selection.lag.lead(data$y,data$x,2)



