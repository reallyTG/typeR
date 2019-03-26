library(MAMSE)


### Name: WKME
### Title: Kaplan-Meier Estimate
### Aliases: WKME
### Keywords: nonparametric survival

### ** Examples

set.seed(2009)
x=list(
  cbind(rexp(20),sample(c(0,1),20,replace=TRUE)),
  cbind(rexp(50),sample(c(0,1),50,replace=TRUE)),
  cbind(rexp(100),sample(c(0,1),100,replace=TRUE))
)

allx=pmin(1,c(x[[1]][x[[1]][,2]==1,1],x[[2]][x[[2]][,2]==1,1],
   x[[3]][x[[3]][,2]==1,1]))
K=WKME(x,1,time=sort(unique(c(0,1,allx,allx-.0001))),boot=.9,REP=100)
# Only 100 bootstrap repetitions were used to get a fast enough
# calculation on a CRAN check.

plot(K$time,K$wkme,type='l',col="blue",xlab="x",
   ylab="P(X<=x)",ylim=c(0,1))
lines(K$time,K$kme[,1],col="red")

lines(K$time,K$wkmeCI[1,],lty=2,col="blue")
lines(K$time,K$wkmeCI[2,],lty=2,col="blue")

lines(K$time,K$kmeCI[1,],lty=2,col="red")
lines(K$time,K$kmeCI[2,],lty=2,col="red")
legend(.1,.9,c("Weighted Kaplan-Meier","Kaplan-Meier"),
   col=c("blue","red"),lty=c(1,1))




