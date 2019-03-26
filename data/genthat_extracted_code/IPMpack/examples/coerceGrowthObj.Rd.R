library(IPMpack)


### Name: coerceGrowthObj
### Title: Function to coerce growth or survival objects, i.e., impose
###   user-defined parameters
### Aliases: coerceGrowthObj coerceSurvObj

### ** Examples

dff<-generateData()

#for growth
gr1 <- makeGrowthObj(dataf=dff,
Formula=sizeNext~size,regType="constantVar")

#halve the slope
gr2 <- coerceGrowthObj(gr1,coeff=c(gr1@fit$coefficients[1],
    gr1@fit$coefficients[2]*0.5),
    sd=gr1@sd)

par(mfrow=c(1,2),pty="s")
picGrow(dff,gr1)
picGrow(dff,gr2)

#for survival
sv1 <- makeSurvObj(dataf=dff,
Formula=surv~size)

#halve the slope
sv2 <- coerceSurvObj(sv1,coeff=c(sv1@fit$coefficients[1],
    sv1@fit$coefficients[2]*0.5))

par(mfrow=c(1,2),pty="s")
picSurv(dff,sv1)
picSurv(dff,sv2)





