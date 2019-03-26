library(systemicrisk)


### Name: default
### Title: Default of Banks
### Aliases: default

### ** Examples

ea <- c(1/2,5/8,3/4)
el <- c(3/2,1/2,1/2)
x <- 0.5
L <- matrix(c(0,x,1-x,1-x,0,x,x,1-x,0),nrow=3)
default(L,ea,el)
default(L,ea,el,"cascade")




