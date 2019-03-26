library(MortCast)


### Name: kannisto.predict
### Title: Kannisto Prediction
### Aliases: kannisto.predict

### ** Examples

data(mxM, mxF, package = "wpp2017")
mxm <- subset(mxM, name == "Germany")[,"2010-2015"]
ages <- c(0, 1, seq(5, 130, by=5))

# using original Kannisto parameters
pars <- kannisto.estimate(mxm[18:21], ages = ages[18:21])
mxm.pred <- kannisto.predict(pars$coefficients, ages = ages[22:28])
plot(ages, c(mxm[1:21], mxm.pred), type="l", log="y", 
    xlab="age", ylab="mx")
    
# Coherent Kannisto
mxf <- subset(mxF, name == "Germany")[,"2010-2015"]
copars <- cokannisto.estimate(
   mxm[18:21], mxf[18:21], ages = ages[18:21])
cmxm.pred <- kannisto.predict(copars[["male"]]$coefficients, ages = ages[22:28])
cmxf.pred <- kannisto.predict(copars[["female"]]$coefficients, ages = ages[22:28])
plot(ages, c(mxm[1:21], cmxm.pred), type="l", log="y", 
    xlab="age", ylab="mx", col="blue")
lines(ages, c(mxf[1:21], cmxf.pred), col="red")




