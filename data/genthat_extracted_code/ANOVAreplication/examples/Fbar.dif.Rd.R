library(ANOVAreplication)


### Name: Fbar.dif
### Title: F-bar for inequality constraints with minimum differences
###   between means
### Aliases: Fbar.dif
### Keywords: htest

### ** Examples

data <- data.frame(y=ChickWeight$weight,g=ChickWeight$Diet)
aggregate(data$y,by=list(data$g),mean)

#make Amat with constraints: 1<4,2<4,3<4 (last constraint is not true)
Amat <- (rbind(c(-1,0,0,1),c(0,-1,0,1),c(0,0,-1,1)))
#minimal differences for each constraint
difmin=c(30,15,1)

Fbar.dif(data,Amat,difmin=difmin)

#Fbar.dif for effect sizes
Amat <- (rbind(c(-1,0,0,1),c(0,-1,0,1),c(0,0,-1,1)))
difmin=c(0.8,0.5,0.2)

Fbar.dif(data,Amat,difmin,effectsize=TRUE)



