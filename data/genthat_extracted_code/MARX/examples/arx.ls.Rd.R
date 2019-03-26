library(MARX)


### Name: arx.ls
### Title: The ARX estimation by OLS function
### Aliases: arx.ls
### Keywords: estimation pseudo-causal

### ** Examples

data <- sim.marx(c('t',3,1),c('t',1,1),100,0.5,0.4,0.3)
arx.ls(data$y,data$x,2)



