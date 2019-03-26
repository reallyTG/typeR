library(abe)


### Name: my_update2
### Title: update function which searches for objects within the parent
###   environment, gives a nicer output than my_update
### Aliases: my_update2
### Keywords: internal

### ** Examples

## Don't show: 
set.seed(1)
n=100
x1<-runif(n)
x2<-runif(n)
x3<-runif(n)
y<--5+5*x1+5*x2+ rnorm(n,sd=5)
dd<-data.frame(y,x1,x2,x3)
fit<-lm(y~x1+x2+x3,x=TRUE,y=TRUE,data=dd)

ddn<-dd[-1,]
my_update2(fit,data=ddn,data.n="ddn")
my_update2(fit,formula=as.formula(".~.-x1"),data=ddn,data.n="ddn")
## End(Don't show)



