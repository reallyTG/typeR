library(perARMA)


### Name: parmafil
### Title: PARMA filtration
### Aliases: parmafil

### ** Examples

b=matrix(c(1,1,0,0,.5,.5),2,3)
a=matrix(c(1,1,.5,.5),2,2)
s=sample(1:100,50, replace=TRUE)
x=matrix(s,50,1)

parmafil_out<-parmafil(a,b,x)
y=parmafil_out$y
plot(y,type="l")



