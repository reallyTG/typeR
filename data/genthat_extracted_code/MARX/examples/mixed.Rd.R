library(MARX)


### Name: mixed
### Title: The MARX estimation function
### Aliases: mixed mixed.default print.mixed summary.mixed mixed.default
###   print.mixed summary.mixed
### Keywords: causal-noncausal estimation

### ** Examples

data <- sim.marx(c('t',1,1), c('t',1,1),100,0.5,0.4,0.3)
object <- mixed(data$y, data$x, 1, 1)
class(object) <- "mixed"
summary(object)



