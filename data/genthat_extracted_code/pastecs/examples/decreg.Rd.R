library(pastecs)


### Name: decreg
### Title: Time series decomposition using a regression model
### Aliases: decreg
### Keywords: ts smooth

### ** Examples

data(marphy)
density <- ts(marphy[, "Density"])
plot(density)
Time <- time(density)

# Linear model to represent trend
density.lin <- lm(density ~ Time)
summary(density.lin)
xreg <- predict(density.lin)
lines(xreg, col=3)
density.dec <- decreg(density, xreg)
plot(density.dec, col=c(1, 3, 2), xlab="stations")

# Order 2 polynomial to represent trend
density.poly <- lm(density ~ Time + I(Time^2))
summary(density.poly)
xreg2 <- predict(density.poly)
plot(density)
lines(xreg2, col=3)
density.dec2 <- decreg(density, xreg2)
plot(density.dec2, col=c(1, 3, 2), xlab="stations")

# Fit a sinusoidal model on seasonal (artificial) data
tser <- ts(sin((1:100)/12*pi)+rnorm(100, sd=0.3), start=c(1998, 4),
        frequency=24)
Time <- time(tser)
tser.sin <- lm(tser ~ I(cos(2*pi*Time)) + I(sin(2*pi*Time)))
summary(tser.sin)
tser.reg <- predict(tser.sin)
tser.dec <- decreg(tser, tser.reg)
plot(tser.dec, col=c(1, 4), xlab="stations", stack=FALSE, resid=FALSE,
        lpos=c(0, 4))
plot(tser.dec, col=c(1, 4, 2), xlab="stations")

# One can also use nonlinear models (see 'nls')
# or autoregressive models (see 'ar' and others in 'ts' library)



