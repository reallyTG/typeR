library(MARX)


### Name: marx
### Title: The MARX function
### Aliases: marx
### Keywords: estimation selection

### ** Examples

data <- sim.marx(c('t',1,1), c('t',1,1),100,0.5,0.4,0.3)
p_max <- 8
sig_level <- 0.05
marx(data$y, data$x, p_max, sig_level,1,1) ## p_C and p_NC chosen to be 1: MARX(1,1,1) output.
marx(data$y, NULL, p_max,sig_level,1,1) ## MAR(1,1), no exogenous variable specified.



