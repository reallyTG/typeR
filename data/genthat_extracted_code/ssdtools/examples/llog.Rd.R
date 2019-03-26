library(ssdtools)


### Name: llog
### Title: Log-Logistic Distribution
### Aliases: llog dllog qllog pllog rllog

### ** Examples

x <- rllog(1000)
hist(x,freq=FALSE,col='gray',border='white')
curve(dllog(x),add=TRUE,col='red4',lwd=2)



