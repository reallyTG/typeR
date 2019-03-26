library(abe)


### Name: my_update
### Title: update function which searches for objects within the parent
###   environment
### Aliases: my_update
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
my_update(fit,data=ddn)
my_update(fit,formula=as.formula(".~.-x1"),data=ddn)
## End(Don't show)



