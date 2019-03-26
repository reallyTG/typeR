library(concor)


### Name: concorcano
### Title: Canonical analysis of several sets with another set
### Aliases: concorcano

### ** Examples

x<-matrix(runif(50),10,5);y<-matrix(runif(90),10,9)
x<-scale(x);y<-scale(y)
ca<-concorcano(x,y,c(3,2,4),2)
diag(t(ca$cx)%*%ca$cy[1:10,]/10)^2
ca$rho2[1,]



