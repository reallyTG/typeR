library(semsfa)


### Name: summary.semsfa
### Title: Summary for 'semsfa' object
### Aliases: summary.semsfa

### ** Examples
 
#generate data
set.seed(0)
n<-200

x<- runif(n, 1, 2)
fy<- 2+30*x-5*x^2
v<- rnorm(n, 0, 1)
u<- abs(rnorm(n,0,2.5))
#production frontier
y <- fy + v - u

dati<-data.frame(y,x)

#first-step: gam, second-step: fan (default)
#without bootstrap
o<-semsfa(y~s(x),dati,sem.method="gam")
summary(o)

# ... with bootstrap
o<-semsfa(y~s(x),dati,sem.method="gam",n.boot=100)
summary(o)



