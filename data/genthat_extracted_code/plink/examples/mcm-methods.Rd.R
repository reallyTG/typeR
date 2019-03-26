library(plink)


### Name: mcm-methods
### Title: Multiple-Choice Model Response Probabilities
### Aliases: mcm mcm-methods mcm,matrix,numeric-method
###   mcm,data.frame,numeric-method mcm,list,numeric-method
###   mcm,irt.pars,ANY-method mcm,sep.pars,ANY-method
### Keywords: methods distribution

### ** Examples

###### Unidimensional Examples ######
## Item parameters from Thissen & Steinberg (1984, p. 510)
## Items R,S,T,U for the whole test
a <- matrix(c(-1.7, -1, 1.1, .3, 1.9, 
  -2.1, -.6, 1.2, 2.3, -.8, 
  -1.3, -.9, -.2, 1.9, .5, 
  -1.9, -.5, 0, -.6, 1.9),4,5,byrow=TRUE)
c <- matrix(c(.3, -2.3, 2.4, -2.5, 2.1, 
  2.1, .05, -3, -.6, 1, 
  -.9, -2.5, -.1, 1.8, 1.6, 
  -.1, -2, .5, .8, .8),4,5,byrow=TRUE)
d <- matrix(c(.25, .25, .25, .25, 
  .2, .2, .4, .2, 
  .2, .2, .4, .2, 
  .25, .25, .25, .25),
  4,4,byrow=TRUE)
pars <- cbind(a,c,d)
x <- mcm(pars, rep(5,4))
plot(x,item.names=paste("Item",c("R","S","T","U")), 
  auto.key=list(space="right"))

## Item parameters from Thissen & Steinberg (1984, p. 511)
## Items W,X,Y,Z for the 
pars <- vector("list",3)
pars[[1]] <- matrix(c(-2.3, -.2, 2, .9, -.3, 
  -.8, .6, -.5, 1.1, -.4, 
  -.5, -.2, 2, -1.2, 0, 
  -1.5, -.7, -.2, .1, 2.3),4,5,byrow=TRUE)
pars[[2]] <- matrix(c(.5, .7, -.5, -1.9, 1.1, 
  1.6, -2.8, 1.5, 0, -.3, 
  -.3, .7, -1, .7, 0, 
  .4, .4, -.5, .5, -.8),4,5,byrow=TRUE)
pars[[3]] <- matrix(c(.2, .4, .2, .2, 
  .2, .2, .4, .2, 
  .2, .4, .2, .2, 
  .2, .2, .2, .4), 4,4,byrow=TRUE)
x <- mcm(pars, rep(5,4))
plot(x,item.names=paste("Item",c("W","X","Y","Z")), 
  auto.key=list(space="right"))


###### Multidimensional Example ######
## Discrimination and category parameters from Bolt & Johnson (in press)
pars <- matrix(c(-1.28, -1.029, -0.537, 0.015, 0.519, 0.969, 1.343,
1.473, -0.585, -0.561, -0.445, -0.741, -0.584, 1.444,
0.29, 0.01, 0.04, 0.34, 0, -0.04, -0.63,
0.01, 0.09, 0.09, 0.28, 0.22, 0.31),1,27)
x <- mcm(pars, cat=7, dimensions=2)
# Plot separated surfaces
plot(x,separate=TRUE,drape=TRUE)



