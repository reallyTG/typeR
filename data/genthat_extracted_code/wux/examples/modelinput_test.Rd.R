library(wux)


### Name: modelinput_test
### Title: Example model specification file for models2wux
### Aliases: modelinput_test
### Keywords: datasets

### ** Examples

## Not run: 
##D ## Here is how to use the climate model specification file
##D ## "modelinput_test" for models2wux.
##D 
##D ## I) DOWNLOAD EXEMPLARY DATA
##D ## download temperature fields of two example GCMs (NorESM1-M and
##D ## CanESM2) with the  RCP 8.5 and the historical run
##D ## into your temporary directory. This command will create a folder
##D ## "CMIP5" in "~/tmp" with two subfolders for each model again with
##D ## two subfolders for each experiment.
##D CMIP5fromESGF(save.to = "~/tmp/CMIP5/",
##D               models = c("NorESM1-M", "CanESM2"),
##D               variables = c("tas"),
##D               experiments= c("historical", "rcp85"))
##D 
##D ## II) INTERFACE FOR THE DATA (type list)
##D ## This is the information for models2wux to read in the data. Usually
##D ## you have to create such a file for yourself, or add it to an existing
##D ## one. This file assumes you have downloaded the two GCMs into ~/tmp/CMIP5 by
##D ## CMIP5fromESGF, as shown above.
##D data(modelinput_test)
##D 
##D ## III) CONTROL FILE FOR models2wux (type list)
##D ## What climate data you want to read in (here it is the two example
##D ## simluations mentioned above)? What subregion to analysze? What is you
##D ## reference and what your scenario period? Aggregate to specific
##D ## seasons? 
##D data(userinput_CMIP5_timeseries)
##D 
##D ## IV) CONVERT CLIMATE SIMULATIONS TO A data.frame
##D wux.test <- models2wux(userinput_CMIP5_timeseries, modelinput_test)
##D 
##D ## V) ANALYZE data.frame
##D require(lattice)
##D wux.test$year <- as.integer(as.character(wux.test$year))
##D xyplot(air_temperature ~ year|season,
##D        groups=acronym,
##D        data = wux.test,
##D        type = c("l", "g"),
##D        main = "NorESM1-M and CanESM2 simulations over Alpine Region\n
##D        historical and RCP 8.5 forcing")
## End(Not run)




