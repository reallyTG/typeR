library(ssdtools)


### Name: gompertz
### Title: Gompertz Distribution
### Aliases: gompertz dgompertz qgompertz pgompertz rgompertz

### ** Examples

x <- rgompertz(1000,1,0.1)
hist(log(x),freq=FALSE,col='gray',border='white')
hist(x,freq=FALSE,col='gray',border='white')
curve(dgompertz(x,1,0.1),add=TRUE,col='red4',lwd=2)



