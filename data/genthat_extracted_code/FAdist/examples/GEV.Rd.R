library(FAdist)


### Name: GEV
### Title: Generalized Extreme Value Distribution (for maxima)
### Aliases: dgev pgev qgev rgev
### Keywords: distribution

### ** Examples

x <- rgev(1000,-.1,3,100)
hist(x,freq=FALSE,col='gray',border='white')
curve(dgev(x,-.1,3,100),add=TRUE,col='red4',lwd=2)



