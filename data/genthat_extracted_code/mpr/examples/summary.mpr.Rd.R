library(mpr)


### Name: summary.mpr
### Title: Summarising Multi-Parameter Regression (MPR) Fits
### Aliases: summary.mpr print.summary.mpr overallpval

### ** Examples

# Veterans' administration lung cancer data
data(veteran, package="survival")
head(veteran)

# Weibull MPR treatment model (family = "Weibull" by default)
mod1 <- mpr(Surv(time, status) ~ list(~ trt, ~ trt), data=veteran)

summary(mod1)



