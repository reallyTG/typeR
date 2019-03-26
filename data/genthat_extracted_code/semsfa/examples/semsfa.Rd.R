library(semsfa)


### Name: semsfa
### Title: Semiparametric Estimation of Stochastic Frontier Models
### Aliases: semsfa

### ** Examples
  
set.seed(0)
n<-200

x<- runif(n, 1, 2)
v<- rnorm(n, 0, 1)
u<- abs(rnorm(n,0,2.5))

#cost frontier
fy<- 2+30*x+5*x^2
y <- fy + v + u

dati<-data.frame(y,x)
#first-step: gam, second-step: fan
o<-semsfa(y~s(x),dati,sem.method="gam",ineffDecrease=FALSE)
#first-step: gam, second-step: mm
## Not run: o<-semsfa(y~s(x),dati,sem.method="gam",ineffDecrease=FALSE,var.method="mm")
plot(x,y)
curve(2+30*x+5*x^2,add=TRUE)
points(sort(x),o$fitted[order(x)],col=3,type="l")

#production frontier
fy<- 2+30*x-5*x^2
y <- fy + v - u

dati<-data.frame(y,x)
#first-step: gam, second-step: fan
o<-semsfa(y~s(x),dati,sem.method="gam",ineffDecrease=TRUE)

plot(x,y)
curve(2+30*x-5*x^2,add=TRUE)
points(sort(x),o$fitted[order(x)],col=3,type="l")

#imposing monotonicity restrictions on inputs
set.seed(25)
n=150

x=runif(n,0,3)
u=abs(rnorm(n,0,1))
v=rnorm(n,0,.75*((pi-2)/pi))

#production frontier
fy<-10-5*exp(-x)
y <- fy+v-u

dati<-data.frame(y,x)
#first-step: monotone gam, second-step: fan
o<-semsfa(y~pbm(x,mono="up"),sem.method = "gam.mono",dati)
plot(x,y)
curve(10-5*exp(-x),add=TRUE)
points(sort(x),o$fitted[order(x)],col=3,type="l")




