library(elliptic)


### Name: limit
### Title: Limit the magnitude of elements of a vector
### Aliases: limit
### Keywords: math

### ** Examples


x <- c(rep(1,5),300, -200)
limit(x,100)
limit(x,upper=200,lower= -400)
limit(x,upper=200,lower= -400,na=TRUE)



