library(kmlShape)


### Name: DouglasPeucker
### Title: ~ Function: DouglasPeucker ~
### Aliases: DouglasPeucker DouglasPeuckerEpsilon DouglasPeuckerNbPoints

### ** Examples

Px <- (1:100)/10
Py <- dnorm(Px,3,1)+dnorm(Px,7,1)+Px/10


### Example 1
### Simplification using epsilon

par(mfrow=c(2,2))
plot(Px,Py,type="l")
plot(DouglasPeuckerEpsilon(Px,Py,0.01),type="b",col=4)
plot(DouglasPeuckerEpsilon(Px,Py,0.04),type="b",col=3)
plot(DouglasPeuckerEpsilon(Px,Py,0.1),type="b",col=2)

### Example 2
### Simplification using nbPoints

par(mfrow=c(2,2))
plot(Px,Py,type="l")
plot(DouglasPeuckerNbPoints(Px,Py,20),type="b",col=4)
plot(DouglasPeuckerNbPoints(Px,Py,10),type="b",col=3)
plot(DouglasPeuckerNbPoints(Px,Py,5),type="b",col=2)


### Example 3
### Simplification with and without smoothing

Py <- dnorm(Px,3,1)+dnorm(Px,7,1)+Px/10+rnorm(100,,0.1)

par(mfrow=c(2,2))
plot(Px,Py,type="l")
plot(DouglasPeuckerNbPoints(Px,Py,20),type="b",col=4)
plot(DouglasPeuckerNbPoints(Px,Py,20,spar=0.5),type="b",col=3)
plot(DouglasPeuckerNbPoints(Px,Py,10,spar=0.5),type="b",col=2)



