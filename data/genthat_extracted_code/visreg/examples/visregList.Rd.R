library(visreg)


### Name: visregList
### Title: Join multiple visreg objects together in a list
### Aliases: visregList

### ** Examples

fit <- lm(Ozone ~ Solar.R + Wind + Temp, data=airquality)
v1 <- visreg(fit, "Wind", plot=FALSE, alpha=0.2)
v2 <- visreg(fit, "Wind", plot=FALSE, alpha=0.01)
vv1 <- visregList(v1, v2, collapse=FALSE)
vv2 <- visregList(v1, v2, collapse=TRUE,
                  labels=c("Confidence: 0.80", "Confidence: 0.99"))
op <- par(mfrow=c(1,2))
plot(vv1)
par(op)
plot(vv2)



