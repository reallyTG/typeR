library(splancs)


### Name: k12hat
### Title: Bivariate K-function
### Aliases: k12hat
### Keywords: spatial

### ** Examples

data(okwhite)
data(okblack)
okpoly <- list(x=c(okwhite$x, okblack$x), y=c(okwhite$y, okblack$y))
plot(seq(5,80,5), sqrt(k12hat(as.points(okwhite), as.points(okblack), 
bboxx(bbox(as.points(okpoly))), seq(5,80,5))/pi) - seq(5,80,5), xlab="distance", 
ylab=expression(hat(L)[12]), ylim=c(-20,20), type="l")



