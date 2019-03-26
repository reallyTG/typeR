library(systemicrisk)


### Name: Model.p.constant
### Title: Model for a Constant p
### Aliases: Model.p.constant

### ** Examples

m <- Model.p.constant(5,0.25)
m$matr(m$rtheta())

p <- matrix(c(0,0.99,0.99,0.5,0.5,0,0.01,0.01,0),nrow=3)
m <- Model.p.constant(5,p)
m$matr(m$rtheta())



