library(errint)


### Name: error_interval
### Title: Error Intervals
### Aliases: as.error_interval error_interval is.error_interval

### ** Examples

error_interval(rnorm(10))

error_interval(rnorm(10),s=0.1,dist="lm")


l<-list(min=-1,max=1,err=0.05,s=0.1,dist="n",phi=rnorm(10))
as.error_interval(l)

v<-c("a","b")
as.error_interval(v)


l<-list(min=-1,max=1,err=0.05,s=0.1,dist="n",phi=rnorm(10))
is.error_interval(l)
res<-as.error_interval(l)
is.error_interval(res)



