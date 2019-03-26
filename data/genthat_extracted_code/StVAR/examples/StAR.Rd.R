library(StVAR)


### Name: StAR
### Title: Student's t Autoregression (StAR)
### Aliases: StAR StAR

### ** Examples

## StAR Model#####
## Random number seed
set.seed(4093)

## Creating trend variable.
t <- seq(1,100,1)

# Generating data on y and x. 
y <-  0.004 + 0.0045*t - 0.09*t^2 + 0.001*t^3 + 50*rt(100,df=5)

# The trend matrix
Trend <- cbind(1,poly(t,3,raw=TRUE))

# Estimating the model
star <- StAR(y,lag=1,Trend=Trend,v=5,maxiter=2000)

# Generate arbitrary dates
dates <- seq(as.Date("2014/1/1"), as.Date("2016/1/1"), "weeks")

## Plotting the variable y, its estimated trend and the fitted value. 
d <- dates[2:length(y)] ; Y <- cbind(y[2:length(y)],star$fitted,star$trend)
color <- c("black","blue","black") ; legend <- c("data","trend","fitted values")
cvar <- cbind(star$cvar)
par(mfcol=c(3,1))
matplot(d,Y,xlab="Months",type='l',lty=c(1,2,3),lwd=c(1,1,3),col=color,ylab="",xaxt="n")
axis.Date(1,at=seq(as.Date("2014/1/1"), as.Date("2016/1/1"),"months"),labels=TRUE)
legend("bottomleft",legend=legend,lty=c(1,2,3),lwd=c(1,1,3), col=color,cex=.85)
hist(star$res,main="Residuals",xlab="",ylab="frequency") ## Histogram of y
matplot(d,cvar,xlab="Months",type='l',lty=2,lwd=1,ylab="fitted variance",xaxt="n")
axis.Date(1,at=seq(as.Date("2014/1/1"), as.Date("2016/1/1"),"months"),labels=TRUE)



