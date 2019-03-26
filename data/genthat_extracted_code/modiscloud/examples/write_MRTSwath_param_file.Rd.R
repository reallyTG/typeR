library(modiscloud)


### Name: write_MRTSwath_param_file
### Title: Write a parameter control file for MRTSwath
### Aliases: write_MRTSwath_param_file

### ** Examples

# Source MODIS files (both data and geolocation)
# Code excluded from CRAN check because it depends on modiscdata
## Not run: 
##D library(devtools)
##D # The modiscdata (MODIS c=cloud data=data) package is too big for CRAN (60 MB); so it is available on github:
##D # https://github.com/nmatzke/modiscdata
##D # If we can't get install_github() to work, try install_url():
##D # install_github(repo="modiscdata", username="nnmatzke")
##D install_url(url="https://github.com/nmatzke/modiscdata/archive/master.zip")
##D library(modiscdata)
##D moddir = system.file("extdata/2002raw/", package="modiscdata")
##D 
##D # Get the matching data/geolocation file pairs
##D fns_df = check_for_matching_geolocation_files(moddir, modtxt="MYD35_L2", geoloctxt="MYD03")
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
##D 	prmfn = write_MRTSwath_param_file(prmfn="tmpMRTparams.prm", tifsdir=tifsdir, modfn=fns_df$mod35_L2_fns[i], geoloc_fn=fns_df$mod03_fns[i], ul_lon=ul_lon, ul_lat=ul_lat, lr_lon=lr_lon, lr_lat=lr_lat)
##D 	print(scan(file=prmfn, what="character", sep="\n"))
##D 
##D 	}
## End(Not run)



