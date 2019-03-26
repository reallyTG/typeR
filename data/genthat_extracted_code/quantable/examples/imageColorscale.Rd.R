library(quantable)


### Name: imageColorscale
### Title: if you need an colorscale to you imagelables use this
### Aliases: imageColorscale

### ** Examples

x = matrix(rnorm(20*30, 5),ncol=20)
rownames(x) <- 1:30
colnames(x) <- letters[1:20]
imageColorscale(x)
imageColorscale(x,col=getBlueWhiteRed(), zlim=c(-1,1))
imageColorscale(x,col=getBlueWhiteRed(), zlim=c(-5,5))



