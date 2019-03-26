library(mkin)


### Name: transform_odeparms
### Title: Functions to transform and backtransform kinetic parameters for
###   fitting
### Aliases: transform_odeparms backtransform_odeparms
### Keywords: manip

### ** Examples

SFO_SFO <- mkinmod(
  parent = list(type = "SFO", to = "m1", sink = TRUE),
  m1 = list(type = "SFO"))
# Fit the model to the FOCUS example dataset D using defaults
fit <- mkinfit(SFO_SFO, FOCUS_2006_D, quiet = TRUE)
summary(fit, data=FALSE) # See transformed and backtransformed parameters

## Not run: 
##D fit.2 <- mkinfit(SFO_SFO, FOCUS_2006_D, transform_rates = FALSE, quiet = TRUE)
##D summary(fit.2, data=FALSE)
## End(Not run)

initials <- fit$start$value
names(initials) <- rownames(fit$start)
transformed <- fit$start_transformed$value
names(transformed) <- rownames(fit$start_transformed)
transform_odeparms(initials, SFO_SFO)
backtransform_odeparms(transformed, SFO_SFO)

## Not run: 
##D # The case of formation fractions
##D SFO_SFO.ff <- mkinmod(
##D   parent = list(type = "SFO", to = "m1", sink = TRUE),
##D   m1 = list(type = "SFO"),
##D   use_of_ff = "max")
##D 
##D fit.ff <- mkinfit(SFO_SFO.ff, FOCUS_2006_D, quiet = TRUE)
##D summary(fit.ff, data = FALSE)
##D initials <- c("f_parent_to_m1" = 0.5)
##D transformed <- transform_odeparms(initials, SFO_SFO.ff)
##D backtransform_odeparms(transformed, SFO_SFO.ff)
##D 
##D # And without sink
##D SFO_SFO.ff.2 <- mkinmod(
##D   parent = list(type = "SFO", to = "m1", sink = FALSE),
##D   m1 = list(type = "SFO"),
##D   use_of_ff = "max")
##D 
##D 
##D fit.ff.2 <- mkinfit(SFO_SFO.ff.2, FOCUS_2006_D, quiet = TRUE)
##D summary(fit.ff.2, data = FALSE)
## End(Not run)



