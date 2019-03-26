library(marima)


### Name: arma.filter
### Title: arma.filter
### Aliases: arma.filter

### ** Examples


library(marima)
data(austr)
series<-t(austr)[,1:90]
# Define marima model
Model5 <- define.model(kvar=7,ar=1,ma=1,rem.var=1,reg.var=6:7)

# Estimate marima model
Marima5 <- marima(series,Model5$ar.pattern,Model5$ma.pattern,penalty=1)

# Calculate residuals by filtering
Resid <- arma.filter(series, Marima5$ar.estimates,
     Marima5$ma.estimates)

# Compare residuals

plot(Marima5$residuals[2, 5:90], Resid$residuals[2, 5:90],
xlab='marima residuals', ylab='arma.filter residuals')




