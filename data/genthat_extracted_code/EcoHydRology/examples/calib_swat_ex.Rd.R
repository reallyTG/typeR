library(EcoHydRology)


### Name: calib_swat_ex
### Title: A function demostrate an example series of steps to calibrate a
###   reach in the SWAT2005 watershed model.
### Aliases: calib_swat_ex

### ** Examples

## Not run: 
##D #
##D install.packages("SWATmodel")
##D #
##D # Load library, test SWAT numerics, define a flow gage id for USGS gage, or build similar list
##D # of data as presented in ?get_usgs_gage
##D #
##D library(SWATmodel)
##D testSWAT2005()
##D flowgage_id="04216500"
##D flowgage=get_usgs_gage(flowgage_id)
##D #
##D # Obtain basic set of historical forcing data from TAMU/Cornell/IWMI CFSR repository
##D #
##D hist_wx=get_cfsr_latlon(flowgage$declat,flowgage$declon)
##D #
##D # Build a generic 9 HRU SWAT initialization, which builds and changes into directory
##D # named as flowgage_id above.
##D #
##D build_swat_basic(dirname=flowgage_id,iyr="1979",nbyr=6,flowgage$area,
##D flowgage$elev,flowgage$declat,flowgage$declon,hist_wx=hist_wx)
##D #
##D # Simple calibration based on the outflow from RCH 3 of the simple SWAT initialization
##D #
##D calib_swat_results=calib_swat_ex(flowgage,rch=3)
##D #
##D # Graph output as hydro graph and pred/obs graphics
##D plot(calib_swat_results$flowdata,flowgage$flowdata)
##D 
## End(Not run)



