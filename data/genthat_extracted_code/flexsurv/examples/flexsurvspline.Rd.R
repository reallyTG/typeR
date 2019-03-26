library(flexsurv)


### Name: flexsurvspline
### Title: Flexible survival regression using the Royston/Parmar spline
###   model.
### Aliases: flexsurvspline
### Keywords: models survival

### ** Examples


## Best-fitting model to breast cancer data from Royston and Parmar (2002)
## One internal knot (2 df) and cumulative odds scale

spl <- flexsurvspline(Surv(recyrs, censrec) ~ group, data=bc, k=1, scale="odds")

## Fitted survival

plot(spl, lwd=3, ci=FALSE)

## Simple Weibull model fits much less well

splw <- flexsurvspline(Surv(recyrs, censrec) ~ group, data=bc, k=0, scale="hazard")
lines(splw, col="blue", ci=FALSE)

## Alternative way of fitting the Weibull

## Not run: 
##D splw2 <- flexsurvreg(Surv(recyrs, censrec) ~ group, data=bc, dist="weibull")
## End(Not run)




