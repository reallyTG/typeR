library(systemicrisk)


### Name: default_cascade
### Title: Default Cascade
### Aliases: default_cascade

### ** Examples

ea <- c(1/2,5/8,3/4)
el <- c(3/2,1/2,1/2)
x <- 0.5
L <- matrix(c(0,x,1-x,1-x,0,x,x,1-x,0),nrow=3)
default_cascade(L,ea,el)



