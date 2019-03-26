library(stratification)


### Name: Sweden
### Title: The MU284 Population of Sweden Municipalities from Sarndal et
###   al. (1992)
### Aliases: Sweden
### Keywords: datasets

### ** Examples

X <- Sweden$REV84
Y <- Sweden$RMT85

# Study of the relationship between X and Y
plot(log(X), log(Y))
# Extreme values are omitted for a more robust estimation
keep <- X/Y>quantile(X/Y,0.03)&X/Y<quantile(X/Y,0.97)
plot(log(X)[keep], log(Y)[keep])
reg<-lm( log(Y)[keep]~log(X)[keep] )
summary(reg)

# Stratification assuming X=Y
nomodel <- strata.LH(x=X, CV=0.05, Ls=3, alloc=c(0.5,0,0.5), takeall=1, model="none")
nomodel
var.strata(nomodel, y=Y) # The target CV is not reached

# Stratification taking into account a loglinear model between X and Y, 
# using the estimated parameters values
model <- strata.LH(x=X, CV=0.05, Ls=3, alloc=c(0.5,0,0.5), takeall=1, model="loglinear",
        model.control=list(beta=reg$coef[2], sig2=summary(reg)$sigma^2, ph=1))
model
var.strata(model, y=Y) # The target CV is reached



