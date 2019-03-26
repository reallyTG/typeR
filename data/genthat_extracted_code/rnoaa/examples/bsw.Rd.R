library(rnoaa)


### Name: bsw
### Title: Blended sea winds (BSW)
### Aliases: bsw

### ** Examples

## Not run: 
##D # 6hrly data
##D ## uv
##D x <- bsw(date = "2017-10-01")
##D ## stress
##D y <- bsw(date = "2011-08-01", uv_stress = "stress")
##D 
##D # daily
##D z <- bsw(date = "2017-10-01", resolution = "daily")
##D 
##D # monthly
##D w <- bsw(date = "2011-08", resolution = "monthly")
##D 
##D # clm
##D # x <- bsw(resolution = "clm")
## End(Not run)



