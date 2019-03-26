library(cit)


### Name: linreg
### Title: F Test for Linear Model
### Aliases: linreg
### Keywords: htest nonparametric

### ** Examples

ss = 500
cols = 6
nm.y = "y"
nms.full = paste( "x", 1:(cols-1), sep="" )
nms.redu = paste( "x", 1:2, sep="" )

mydat = as.data.frame( matrix( rnorm( ss*cols ), ncol=cols ) )
names( mydat ) = c( nm.y, nms.full )

linreg(nms.full, nms.redu, nm.y, mydat)




