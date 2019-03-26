library(mpr)


### Name: vcov.mpr
### Title: Extracting variance-covariance matrix for MPR models.
### Aliases: vcov.mpr
### Keywords: internal

### ** Examples

# Veterans' administration lung cancer data
data(veteran, package="survival")
head(veteran)

mod1 <- mpr(Surv(time, status) ~ list(~ trt, ~ trt), data=veteran, family="Weibull")
vcov(mod1)
mod1$vcov




