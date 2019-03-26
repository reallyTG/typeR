library(concor)


### Name: concoreg
### Title: Redundancy of sets yj by one set x
### Aliases: concoreg

### ** Examples

x<-matrix(runif(50),10,5);y<-matrix(runif(90),10,9)
x<-scale(x);y<-scale(y)
co<-concoreg(x,y,c(3,2,4),2)
((t(co$cx[,1])%*%y[,1:3]%*%co$v[1:3,1])/10)^2;co$varexp[1,1]
t(co$cx)%*%co$cx /10
diag(t(co$cx)%*%y%*%co$V/10)^2
sum(co$varexp[,1]);sum(co$varexp[,2])



