library(mpr)


### Name: extractIC
### Title: Extracting Information Criteria for MPR models.
### Aliases: extractIC
### Keywords: internal

### ** Examples

# Veterans' administration lung cancer data
data(veteran, package="survival")
head(veteran)

mod1 <- mpr(Surv(time, status) ~ list(~ trt, ~ trt), data=veteran, family="Weibull")
mod1
extractIC(mod1) # AIC
extractIC(mod1, aic=FALSE) # BIC





