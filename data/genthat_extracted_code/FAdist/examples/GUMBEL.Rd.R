library(FAdist)


### Name: GUMBEL
### Title: Gumbel Distribution (for maxima)
### Aliases: dgumbel pgumbel qgumbel rgumbel
### Keywords: distribution

### ** Examples

x <- rgumbel(1000,3,100)
hist(x,freq=FALSE,col='gray',border='white')
curve(dgumbel(x,3,100),add=TRUE,col='red4',lwd=2)



