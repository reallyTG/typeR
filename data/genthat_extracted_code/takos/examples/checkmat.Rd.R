library(takos)


### Name: checkmat
### Title: Title checkmat
### Aliases: checkmat

### ** Examples

npoints=1000
x=seq(1,npoints)
y=(dnorm(x, mean=npoints/2, sd=npoints/10))
x=seq(1,1000)
x2=seq(200,500,length.out=1000)
dat=data.frame(x,x2,y)
colnames(dat) <- c("time.seconds", "temperature.s","heat.flow")
cmat<- checkmat(dat,selected=c(1,0,2,0,0,0,3,0))




