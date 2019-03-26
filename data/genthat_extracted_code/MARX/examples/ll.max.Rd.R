library(MARX)


### Name: ll.max
### Title: The value of the t-log-likelihood for MARX function
### Aliases: ll.max
### Keywords: optimization

### ** Examples

data <- sim.marx(c('t',1,1), c('t',1,1),100,0.5,0.4,0.3)
y <- data$y
x <- data$x
p_C <- 1
p_NC <- 1
params <- c(0.5,0.4,0.3,0,1,1)
ll.max(params,y,x,p_C,p_NC)



