library(eplusr)


### Name: use_idd
### Title: Use a specific EnergyPlus Input Data Dictionary (IDD) file
### Aliases: use_idd download_idd avail_idd is_avail_idd

### ** Examples

## Not run: 
##D # get all available Idd version
##D avail_idd()
##D 
##D # check if specific version of Idd is available
##D is_avail_idd(8.5)
##D 
##D # download latest IDD file from EnergyPlus GitHub repo
##D download_idd("latest", tempdir())
##D 
##D # use specific version of Idd
##D # only works if EnergyPlus v8.8 has been found or Idd v8.8 exists
##D use_idd(8.8)
##D 
##D # If Idd object is currently not avail_idd, automatically download IDD file
##D # from EnergyPlus GitHub repo and parse it
##D use_idd(8.8, download = "auto")
##D 
##D # now Idd v8.8 should be available
##D is_avail_idd(8.8)
##D 
##D # get specific version of parsed Idd object
##D use_idd(8.8)
##D 
##D avail_idd() # should contain "8.8.0"
## End(Not run)



