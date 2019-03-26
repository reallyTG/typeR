library(mod09nrt)


### Name: run_swath2grid_mod09nrt
### Title: Run MRTSwath swath2grid tool
### Aliases: run_swath2grid_mod09nrt

### ** Examples

#######################################################
# Run MRTSwath tool "swath2grid"
#######################################################

# Source MODIS files (both data and geolocation)
# Code excluded from CRAN check because it depends on modiscdata
## Not run: 
##D library(devtools)
##D library(modiscdata)
##D moddir = system.file("extdata/2002raw/", package="modiscdata")
##D 
##D # Get the matching data/geolocation file pairs
##D fns_df = check_for_matching_geolocation_files(moddir, modtxt="MOD09", geoloctxt="MOD03")
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
##D prmfn = write_MRTSwath_param_file_mod09nrt(prmfn="tmpMRTparams.prm", tifsdir=tifsdir,
##D  modfn=fns_df$mod09_fns[i], geoloc_fn=fns_df$mod03_fns[i], ul_lon=ul_lon, ul_lat=ul_lat, 
##D  lr_lon=lr_lon, lr_lat=lr_lat)
##D print(scan(file=prmfn, what="character", sep="\n"))
##D 	
##D run_swath2grid_mod09nrt(mrtpath="swath2grid", prmfn="tmpMRTparams.prm", tifsdir=tifsdir,
##D  modfn=fns_df$mod309_fns[i], geoloc_fn=fns_df$mod03_fns[i], ul_lon=ul_lon, ul_lat=ul_lat,
##D  lr_lon=lr_lon, lr_lat=lr_lat)
##D 
##D 	}
##D 
##D list.files(tifsdir, pattern=".tif", full.names=TRUE)
## End(Not run)




