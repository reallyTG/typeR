library(flux)


### Name: fluxx
### Title: Estimate (ghg) flux rates from online dynamic closed chamber
###   measurements in through-flow mode.
### Aliases: fluxx mf.flux
### Keywords: univar

### ** Examples

## Not run: 
##D ## load data
##D data(tt.nee)
##D 
##D ## prepare flux estimation
##D # make parts with chop
##D tt.parts <- chop(tt.nee, factors=c("session", "spot"), 
##D nmes=c("spot", "date", "session"), min.cm=40)
##D # prepare var.par list (like with flux)
##D vp <- list(CO2 = "NEE", time = "datetime", area = "area", 
##D volume = "volume", t.air = "t.cham", p.air = 101325)
##D 
##D ## do the flux estimation
##D # run fluxx. with lots of data it may take a while 
##D # (approx. 10 sec per chamber)
##D tt.flux <- fluxx(tt.parts, subset=c(1:30), vp, pdk=0.5, 
##D range.lim=3, out.unit="mg")
##D # inspect results table
##D tt.flux
##D # plot diagnostic plots
##D plot(tt.flux, dims=c(4,4), subs="spot")
##D # run fluxx with alternative method
##D tt.fluxa <- fluxx(tt.parts, subset=c(1:30), vp, pdk=0.5, 
##D range.lim=3, out.unit="mg", method="rmse")
##D # inspect results
##D tt.fluxa
## End(Not run)



