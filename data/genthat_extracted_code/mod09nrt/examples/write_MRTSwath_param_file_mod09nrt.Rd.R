library(mod09nrt)


### Name: write_MRTSwath_param_file_mod09nrt
### Title: Write a parameter control file for MRTSwath
### Aliases: write_MRTSwath_param_file_mod09nrt

### ** Examples


# Source MODIS files (both data and geolocation)
# Code excluded from CRAN check because it depends on modiscdata
## Not run: 
##D library(devtools)
##D library(modiscdata)
##D moddir = system.file("extdata/2002raw/", package="modiscdata")
##D 
##D # Get the matching data/geolocation file pairs
##D fns_df = check_for_matching_geolocation_files_mod09nrt(moddir, modtxt="MOD09", geoloctxt="MOD03")
##D fns_df
##D 
##D # Resulting TIF files go in this directory
##D tifsdir = getwd()
##D 
##D 
##D # Box to subset
##D ul_lat = 13
##D ul_lon = -87
##D lr_lat = 8
##D lr_lon = -82
##D 
##D for (i in 1:nrow(fns_df))
##D 	{
##D 	
##D 	prmfn = write_MRTSwath_param_file_mod09nrt(prmfn="tmpMRTparams.prm", tifsdir=tifsdir,
##D 	modfn=fns_df$mod09_fns[i], geoloc_fn=fns_df$mod03_fns[i], ul_lon=ul_lon, ul_lat=ul_lat,
##D 	lr_lon=lr_lon, lr_lat=lr_lat)
##D 	print(scan(file=prmfn, what="character", sep="\n"))
##D 	
##D 	}
## End(Not run)




