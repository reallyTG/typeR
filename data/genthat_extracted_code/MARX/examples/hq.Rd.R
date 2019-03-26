library(MARX)


### Name: hq
### Title: The Hannan-Quinn (HQ) information criterion function
### Aliases: hq
### Keywords: selection

### ** Examples

data <- sim.marx(c('t',1,1), c('t',1,1),100,0.5,0.4,0.3)
hq(data$y, data$x,8)



