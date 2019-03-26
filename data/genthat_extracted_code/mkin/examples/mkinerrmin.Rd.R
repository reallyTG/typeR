library(mkin)


### Name: mkinerrmin
### Title: Calculate the minimum error to assume in order to pass the
###   variance test
### Aliases: mkinerrmin
### Keywords: manip

### ** Examples

SFO_SFO = mkinmod(parent = mkinsub("SFO", to = "m1"),
                  m1 = mkinsub("SFO"),
                  use_of_ff = "max")

fit_FOCUS_D = mkinfit(SFO_SFO, FOCUS_2006_D, quiet = TRUE)
round(mkinerrmin(fit_FOCUS_D), 4)
## Not run: 
##D   fit_FOCUS_E = mkinfit(SFO_SFO, FOCUS_2006_E, quiet = TRUE)
##D   round(mkinerrmin(fit_FOCUS_E), 4)
## End(Not run)



