library(psica)


### Name: psica
### Title: Create a tree that discovers groups having similar treatment
###   (intervention) effects.
### Aliases: psica

### ** Examples

n=100
X1=runif(n)
X1=sort(X1)
f1<- function(x){
  2*tanh(4*x-2)+3
}
X2=runif(n)
X2=sort(X2)
f2<- function(x){
  2*tanh(2*x-1)+2.3 #2.8
}
plot(X1,f1(X1),ylim=c(0,5), type="l")
points(X2,f2(X2), type="l")
Y1=f1(X1)+rnorm(n, 0, 0.8)
Y2=f2(X2)+rnorm(n,0,0.8)
points(X1,Y1, col="blue")
points(X2,Y2, col="red")
data=data.frame(X=c(X1,X2), Y=c(Y1,Y2), interv=c(rep("treat",n), rep("control",n)))
pt=psica(Y~X, data=data, method="normal",intervention = "interv",
 forestControl=list(nBoots=200, mtry=1))
print(pt)
plot(pt)




