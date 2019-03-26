library(mpr)


### Name: mpr
### Title: Fitting a Multi-Parameter Regression (MPR) model.
### Aliases: mpr print.mpr

### ** Examples

# Veterans' administration lung cancer data
data(veteran, package="survival")
head(veteran)

# treatment variable, "trt", in scale (lambda) and shape (gamma)
# components of a Weibull model
mpr(Surv(time, status) ~ list(~ trt, ~ trt), data=veteran, family="Weibull")

# same as first model
mpr(Surv(time, status) ~ trt, data=veteran, family="Weibull")

# now with "celltype" also appearing in the scale
mpr(Surv(time, status) ~ list(~ trt + celltype, ~ trt), data=veteran,
    family="Weibull")

# trt in scale only (this is a PH Weibull model)
mpr(Surv(time, status) ~ list(~ trt, ~ 1), data=veteran, family="Weibull")

# trt in all three components (scale and two shape parameters) of a Burr model
mpr(Surv(time, status) ~ list(~ trt, ~ trt, ~ trt), data=veteran,
    family="Burr")

# use of summary
mod1 <- mpr(Surv(time, status) ~ list(~ trt, ~ trt), data=veteran)
summary(mod1)



