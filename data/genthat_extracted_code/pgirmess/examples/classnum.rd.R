library(pgirmess)


### Name: classnum
### Title: Gives an index vector of the class category of each value of a
###   numerical vector
### Aliases: classnum print.clnum
### Keywords: misc

### ** Examples

x<-rnorm(30)
classnum(x)
classnum(x,breaks="fd")
classnum(x, breaks=c(-1,0,1))
classnum(x,breaks=5)



