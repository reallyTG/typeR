library(gamair)


### Name: CanWeather
### Title: Canadian Weather data
### Aliases: CanWeather
### Keywords: data

### ** Examples

require(gamair);require(mgcv)
data(canWeather)
reg <- unique(CanWeather$region)
place <- unique(CanWeather$place)
col <- 1:4;names(col) <- reg
for (k in 1:35) {
  if (k==1) plot(1:365,CanWeather$T[CanWeather$place==place[k]],
            ylim=range(CanWeather$T),type="l",
	    col=col[CanWeather$region],xlab="day",ylab="temperature") else
	    lines(1:365,CanWeather$T[CanWeather$place==place[k]],
            col=col[CanWeather$region[CanWeather$place==place[k]]])
}

## Function on scalar regression.
## T(t) = f_r(t) + f(t)*latitude + e(t)
## where e(t) is AR1 Gaussian and f_r is
## a smooth for region r.
## 'rho' chosen to minimize AIC or (-ve) REML score. 

b <- bam(T ~ region + s(time,k=20,bs="cr",by=region) +
         s(time,k=40,bs="cr",by=latitude),
         data=CanWeather,AR.start=time==1,rho=.97)

## Note: 'discrete==TRUE' option even faster.

par(mfrow=c(2,3))
plot(b,scale=0,scheme=1)
acf(b$std)




