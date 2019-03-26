library(coxsei)


### Name: Dens
### Title: Density function
### Aliases: Dens
### Keywords: ~distribution ~survival

### ** Examples

set.seed(1); dat <- RND(1000,int=function(x)3*x^2)
hist(dat,freq=FALSE); curve(Dens(x,int=function(x)3*x^2),add=TRUE)



