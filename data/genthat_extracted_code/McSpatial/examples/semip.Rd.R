library(McSpatial)


### Name: semip
### Title: Semi-Parametric Regression
### Aliases: semip
### Keywords: Semi-Parametric Models

### ** Examples


# Single variable in f(z)
par(ask=TRUE)
n = 1000
x <- runif(n,0,2*pi)
x <- sort(x)
z <- runif(n,0,2*pi)
xsq <- x^2
sinx <- sin(x)
cosx <- cos(x)
sin2x <- sin(2*x)
cos2x <- cos(2*x)
ybase1 <-  x - .1*xsq + sinx - cosx - .5*sin2x + .5*cos2x
ybase2 <- -z + .1*(z^2) - sin(z) + cos(z) + .5*sin(2*z) - .5*cos(2*z)
ybase <- ybase1+ybase2
sig = sd(ybase)/2
y <- ybase + rnorm(n,0,sig)

# Correct specification for x; z in f(z)
fit <- semip(y~x+xsq+sinx+cosx+sin2x+cos2x,nonpar=~z,window1=.20,window2=.20)
2*fit$df1 - fit$df2
yvect <- c(min(ybase1,fit$xbhat), max(ybase1, fit$xbhat))
xbhat  <- fit$xbhat - mean(fit$xbhat) + mean(ybase1)
plot(x,ybase1,type="l",xlab="x",ylab="ybase1",ylim=yvect, main="Predictions for XB")
lines(x, xbhat, col="red")

predse <- sqrt(fit$sig2 + fit$nphat.se^2)
nphat <- fit$nphat - mean(fit$nphat) + mean(ybase2)
lower <- nphat + qnorm(.025)*fit$nphat.se
upper <- nphat + qnorm(.975)*fit$nphat.se
o <- order(z)
yvect <- c(min(lower), max(upper))
plot(z[o], ybase2[o], type="l", xlab="z", ylab="f(z) ",
   main="Predictions for f(z) ", ylim=yvect)
lines(z[o], nphat[o], col="red")
lines(z[o], lower[o], col="red", lty="dashed")
lines(z[o], upper[o], col="red", lty="dashed")

## Not run: 
##D # Chicago Housing Sales
##D data(matchdata)
##D match05 <- data.frame(matchdata[matchdata$year==2005,])
##D match05$age <- 2005-match05$yrbuilt
##D 
##D tfit1 <- maketarget(~dcbd,window=.3,data=match05)
##D tfit2 <- maketarget(~longitude+latitude,window=.5,data=match05)
##D 
##D # nonparametric control for dcbd
##D 
##D fit <- semip(lnprice~lnland+lnbldg+rooms+bedrooms+bathrooms+centair+fireplace+brick+
##D garage1+garage2+ age+rr, nonpar=~dcbd, data=match05,targetfull=tfit1)
##D 
##D # nonparametric controls for longitude and latitude
##D 
##D fit <- semip(lnprice~lnland+lnbldg+rooms+bedrooms+bathrooms+centair+fireplace+brick+
##D garage1+garage2+ age+rr+dcbd, nonpar=~longitude+latitude, data=match05, targetfull=tfit2,
##D distance="Latlong")
##D 
##D # Conditionally parametric model:  y = XB + dcbd*lambda(longitude,latitude) + u
##D fit <- semip(lnprice~lnland+lnbldg+rooms+bedrooms+bathrooms+centair+fireplace+
##D  brick+garage1+garage2+age+rr, nonpar=~longitude+latitude, conpar=~dcbd, 
##D  data=match05, distance="Latlong",targetfull=tfit1)
##D 
##D # Conditional parametric model:  y = XB + Z*lambda(longitude,latitude) + u
##D # Z = (dcbd,lnland,lnbldg,age)
##D fit <- semip(lnprice~rooms+bedrooms+bathrooms+centair+fireplace+brick+
##D garage1+garage2+rr, nonpar=~longitude+latitude, conpar=~dcbd+lnland+lnbldg+age, 
##D  data=match05, distance="Latlong",targetfull=tfit2)
## End(Not run)



