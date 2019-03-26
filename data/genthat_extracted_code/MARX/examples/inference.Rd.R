library(MARX)


### Name: inference
### Title: Asymptotic inference for the MARX function
### Aliases: inference
### Keywords: causal-noncausal inference

### ** Examples

data <- sim.marx(c('t',1,1), c('t',1,1),100,0.5,0.4,0.3)
y <- data$y
x <- data$x
res <- marx.t(y,x,1,1)
inference(y,x,res$coef.c,res$coef.nc,res$coef.exo,res$coef.int,res$scale,res$df,0.05)



