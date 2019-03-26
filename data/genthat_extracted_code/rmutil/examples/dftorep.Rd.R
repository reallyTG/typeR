library(rmutil)


### Name: dftorep
### Title: Transform a Dataframe to a repeated Object
### Aliases: dftorep
### Keywords: manip

### ** Examples

y <- data.frame(y1=rpois(20,5),y2=rpois(20,5))
y[2,2] <- NA
idd <- c(rep(1,5),rep(2,10),rep(3,5))
tt <- c(1:5,1:10,1:5)
totals <- data.frame(tot1=rep(12,20),tot2=rep(12,20))
x2 <- c(rep(1,5),rep(2,10),rep(3,5))
df <- data.frame(y,id=idd,tt=tt,totals,x1=rnorm(20),x2=x2)
df
dftorep(df,resp=c("y1","y2"),times="tt",id="id",totals=c("tot1","tot2"),
	tvcov="x1",ccov="x2")
dftorep(df,resp=c("y1","y2"),times="tt",id="id",totals=c("tot1","tot2"),
	tvcov="x1",ccov="x2",na.rm=FALSE)
# x1 is not a time-constant covariate
#dftorep(df,resp=c("y1","y2"),times="tt",id="id",ccov="x1",na.rm=FALSE)



