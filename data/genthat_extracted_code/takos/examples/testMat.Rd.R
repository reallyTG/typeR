library(takos)


### Name: testMat
### Title: Title testMat
### Aliases: testMat

### ** Examples

require(data.table)
npoints=1000
x=seq(1,npoints)
y=(dnorm(x, mean=npoints/2, sd=npoints/10))
x=seq(1,1000)
x2=seq(200,500,length.out=1000)
dat=data.frame(x,x2,y)
colnames(dat) <- c("time.seconds", "temperature.s","heat.flow")
dat=data.table(dat)
dat2=dat
dat$rates=20
dat2$rates=50
toTest=list(dat,dat2)
tested=testMat(toTest)



