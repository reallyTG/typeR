library(Publish)


### Name: formatCI
### Title: Formatting confidence intervals
### Aliases: formatCI

### ** Examples


x=ci.mean(rnorm(10))
formatCI(lower=x[3],upper=x[4])
formatCI(lower=c(0.001,-2.8413),upper=c(1,3.0008884))
# change format
formatCI(lower=c(0.001,-2.8413),upper=c(1,3.0008884),format="(l, u)")
# show x
formatCI(x=x$mean,lower=x$lower,upper=x$upper,format="(l, u)",show.x=TRUE)

# if the first lower limit is shorter than the second (missing negative sign),
# then, option trim will make a difference:
formatCI(lower=c(0.001,-2.8413),upper=c(1,3.0008884),format="l--u",trim=FALSE)
formatCI(lower=c(0.001,-2.8413),upper=c(1,3.0008884),format="l--u",trim=TRUE)

# change of handler function
l <- c(-0.0890139,0.0084736,144.898333,0.000000001)
u <- c(0.03911392,0.3784706,3338944.8821221,0.00001)
cbind(format=formatCI(lower=l,upper=u,format="[l;u)",digits=2,nsmall=2,handler="format"),
      prettyNum=formatCI(lower=l,upper=u,format="[l;u)",digits=2,nsmall=2,handler="prettyNum"),
      sprintf=formatCI(lower=l,upper=u,format="[l;u)",digits=2,nsmall=2,handler="sprintf"))




