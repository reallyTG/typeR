library(ssdtools)


### Name: lgumbel
### Title: Log-Gumbel Distribution
### Aliases: lgumbel dlgumbel qlgumbel plgumbel rlgumbel

### ** Examples

x <- rlgumbel(1000,1,0.1)
hist(log(x),freq=FALSE,col='gray',border='white')
hist(x,freq=FALSE,col='gray',border='white')
curve(dlgumbel(x,1,0.1),add=TRUE,col='red4',lwd=2)



