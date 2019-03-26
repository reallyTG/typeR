library(ANOVAreplication)


### Name: Fbar.ineq
### Title: F-bar for inequality constraints
### Aliases: Fbar.ineq
### Keywords: htest

### ** Examples

data <- data.frame(y=ChickWeight$weight,g=ChickWeight$Diet)
aggregate(data$y,by=list(data$g),mean)

#make Amat with constraints: 1<4,2<4,3<4 (last constraint is not true)
Amat <- (rbind(c(-1,0,0,1),c(0,-1,0,1),c(0,0,-1,1)))

Fbar.ineq(data,Amat)



