library(useful)


### Name: reclass
### Title: reclass
### Aliases: reclass reclass<-

### ** Examples

theDF <- data.frame(A=1:10, B=1:10)
reclass(theDF) <- 'newclass'
class(theDF)
theDF <- reclass(theDF, 'another')
class(theDF)




