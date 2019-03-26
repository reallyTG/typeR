library(semsfa)


### Name: efficiencies.semsfa
### Title: Prediction of the individual efficiency score
### Aliases: efficiencies.semsfa

### ** Examples

set.seed(0)
n<-200

#generate data
x<- runif(n, 1, 2)
fy<- 2+30*x-5*x^2
v<- rnorm(n, 0, 1)
u<- abs(rnorm(n,0,2.5))
#production frontier
y <- fy + v - u
dati<-data.frame(y,x)

#first-step: gam, second-step: fan (default)
o<-semsfa(y~s(x),dati,sem.method="gam")

#calculate efficiencies
a<-efficiencies.semsfa(o)  



