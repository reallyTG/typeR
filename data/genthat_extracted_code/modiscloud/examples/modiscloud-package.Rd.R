library(modiscloud)


### Name: modiscloud-package
### Title: Process MODIS cloud mask product files to TIF
### Aliases: modiscloud modiscloud-package
### Keywords: package

### ** Examples

# Test function for checking roxygen2, roxygenize package documentation building
is.pseudoprime(13, 4)

# Some MODIS files are stored in this package's "extdata/" directory
# Here are some example MODIS files in modiscloud/extdata/
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
##D # This directory actually has MYD files (from the MODIS-AQUA platform)
##D # (*will* work with the default files stored in modiscloud/extdata/2002raw/)
##D list.files(path=moddir, pattern="MYD")
##D 
##D # Check for matches (for MODIS-AQUA platform)
##D # (*will* work with the default files stored in modiscloud/extdata/2002raw/)
##D fns_df = check_for_matching_geolocation_files(moddir=moddir, modtxt="MYD35_L2", geoloctxt="MYD03", return_geoloc=FALSE, return_product=FALSE)
##D 
## End(Not run)


#######################################################
# Run MRTSwath tool "swath2grid"
#######################################################

# Source MODIS files (both data and geolocation)
# Code excluded from CRAN check because it depends on modiscdata
## Not run: 
##D library(devtools)
##D # The modiscdata (MODIS c=cloud data=data) package is too big for CRAN (60 MB); so it is available on github:
##D # https://github.com/nmatzke/modiscdata
##D # If we can't get install_github() to work, try install_url():
##D # install_github(repo="modiscdata", username="nnmatzke")
##D # install_url(url="https://github.com/nmatzke/modiscdata/archive/master.zip")
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
##D 	run_swath2grid(mrtpath="swath2grid", prmfn="tmpMRTparams.prm", tifsdir=tifsdir, modfn=fns_df$mod35_L2_fns[i], geoloc_fn=fns_df$mod03_fns[i], ul_lon=ul_lon, ul_lat=ul_lat, lr_lon=lr_lon, lr_lat=lr_lat)
##D 
##D 	}
##D 
##D tiffns = list.files(tifsdir, pattern=".tif", full.names=TRUE)
##D tiffns
##D 
##D 
##D # For some unit testing etc., swath2grid may not be available.  If so, use the default TIFs:
##D if (length(tiffns) == 0)
##D 	{
##D 	library(modiscdata)
##D 	tifsdir = system.file("extdata/2002tif/", package="modiscdata")
##D 	tiffns = list.files(tifsdir, pattern=".tif", full.names=TRUE)
##D 	}
##D 
##D #######################################################
##D # Load a TIF
##D #######################################################
##D library(rgdal)	# for readGDAL
##D 
##D # numpixels in subset
##D xdim = 538
##D ydim = 538
##D 
##D 
##D # Read the grid and the grid metadata
##D coarsen_amount = 1
##D xdim_new = xdim / floor(coarsen_amount)
##D ydim_new = ydim / floor(coarsen_amount)
##D 
##D fn = tiffns[1]
##D grd = readGDAL(fn, output.dim=c(ydim_new, xdim_new))
##D 
##D grdproj = CRS(proj4string(grd))
##D grdproj
##D grdbbox = attr(grd, "bbox")
##D grdbbox
##D 
##D 
##D 
##D 
##D 
##D ###########################
##D # Extract values from a particular pixel
##D ###########################
##D # Greg's field site
##D greglat = 10.2971
##D greglon = -84.79282
##D 
##D grdr = raster(grd)
##D 
##D # Input the points x (longitude), then y (latitude)
##D point_to_sample = c(greglon, greglat)
##D xycoords = adf(matrix(data=point_to_sample, nrow=1, ncol=2))
##D names(xycoords) = c("x", "y")
##D 
##D xy = SpatialPoints(coords=xycoords, proj4string=grdproj)
##D #xy = spsample(x=grd, n=10, type="random")
##D pixelval = extract(grdr, xy)
##D 
##D # Have to convert to 8-bit binary string, and reverse to get the count correct
##D # (also reverse the 2-bit strings in the MODIS Cloud Mask table)
##D pixelval = rev(t(digitsBase(pixelval, base= 2, 8)))
##D print(pixelval)
##D 
## End(Not run)


#######################################################
# Load a TIF
#######################################################
# Code excluded from CRAN check because it depends on modiscdata
## Not run: 
##D library(devtools)
##D # The modiscdata (MODIS c=cloud data=data) package is too big for CRAN (60 MB); so it is available on github:
##D # https://github.com/nmatzke/modiscdata
##D # If we can't get install_github() to work, try install_url():
##D # install_github(repo="modiscdata", username="nnmatzke")
##D # install_url(url="https://github.com/nmatzke/modiscdata/archive/master.zip")
##D library(modiscdata)
##D tifsdir = system.file("extdata/2002tif/", package="modiscdata")
##D tiffns = list.files(tifsdir, pattern=".tif", full.names=TRUE)
##D tiffns
##D 
##D library(rgdal)	# for readGDAL
##D 
##D # numpixels in subset
##D xdim = 538
##D ydim = 538
##D 
##D 
##D # Read the grid and the grid metadata
##D coarsen_amount = 1
##D xdim_new = xdim / floor(coarsen_amount)
##D ydim_new = ydim / floor(coarsen_amount)
##D 
##D fn = tiffns[1]
##D grd = readGDAL(fn, output.dim=c(ydim_new, xdim_new))
##D 
##D grdproj = CRS(proj4string(grd))
##D grdproj
##D grdbbox = attr(grd, "bbox")
##D grdbbox
##D 
##D #######################################################
##D # Extract a particular bit for all the pixels in the grid
##D #######################################################
##D bitnum = 2
##D grdr_vals_bits = get_bitgrid(grd, bitnum)
##D length(grdr_vals_bits)
##D grdr_vals_bits[1:50]
##D 
##D #######################################################
##D # Extract a particular pair of bits for all the pixels in the grid
##D #######################################################
##D bitnum = 2
##D grdr_vals_bitstrings = get_bitgrid_2bits(grd, bitnum)
##D length(grdr_vals_bitstrings)
##D grdr_vals_bitstrings[1:50]
##D 
## End(Not run)

#######################################################
# Load some bit TIFs (TIFs with just the cloud indicators extracted)
# and add up the number of cloudy days, out of the total
# number of observation attempts
#######################################################
# Code excluded from CRAN check because it depends on modiscdata
## Not run: 
##D library(devtools)
##D # The modiscdata (MODIS c=cloud data=data) package is too big for CRAN (60 MB); so it is available on github:
##D # https://github.com/nmatzke/modiscdata
##D # If we can't get install_github() to work, try install_url():
##D # install_github(repo="modiscdata", username="nnmatzke")
##D # install_url(url="https://github.com/nmatzke/modiscdata/archive/master.zip")
##D library(modiscdata)
##D tifsdir = system.file("extdata/2002bit/", package="modiscdata")
##D tiffns = list.files(tifsdir, pattern=".tif", full.names=TRUE)
##D tiffns
##D 
##D library(rgdal)	# for readGDAL
##D 
##D # numpixels in subset
##D xdim = 538
##D ydim = 538
##D 
##D # Read the grid and the grid metadata
##D coarsen_amount = 1
##D xdim_new = xdim / floor(coarsen_amount)
##D ydim_new = ydim / floor(coarsen_amount)
##D 
##D 
##D sum_nums = NULL
##D for (j in 1:length(tiffns))
##D 	{
##D 	fn = tiffns[j]
##D 
##D 	grd = readGDAL(fn, output.dim=c(ydim_new, xdim_new))
##D 
##D 	grdr = raster(grd)
##D 	pointscount_on_SGDF_points = coordinates(grd)
##D 	grdr_vals = extract(grdr, pointscount_on_SGDF_points)
##D 
##D 	# Convert to 1/0 cloudy/not
##D 	data_grdr = grdr_vals
##D 	data_grdr[grdr_vals > 0] = 1
##D 
##D 	grdr_cloudy = grdr_vals
##D 	grdr_cloudy[grdr_vals < 4] = 0
##D 	grdr_cloudy[grdr_vals == 4] = 1
##D 
##D 	# Note: Don't run the double-commented lines unless you want to collapse different bit values.
##D 	# grdr_clear = grdr_vals
##D 	# grdr_clear[grdr_vals == 4] = 0
##D 	# grdr_clear[grdr_vals == 3] = 1
##D 	# grdr_clear[grdr_vals == 2] = 1
##D 	# grdr_clear[grdr_vals == 1] = 1
##D 	# grdr_clear[grdr_vals == 0] = 0
##D 	#
##D 
##D 	if (j == 1)
##D 		{
##D 		sum_cloudy = grdr_cloudy
##D 		#sum_not_cloudy = grdr_clear
##D 		sum_data = data_grdr
##D 		} else {
##D 		sum_cloudy = sum_cloudy + grdr_cloudy
##D 		sum_data = sum_data + data_grdr
##D 		}
##D 
##D 	}
##D 
##D 
##D # Calculate percentage cloudy
##D sum_nums = sum_cloudy / sum_data
##D 
##D grd_final = numslist_to_grd(numslist=sum_nums, grd=grd, ydim_new=ydim_new, xdim_new=xdim_new)
##D 
##D # Display the image (this is just the sum of a few images)
##D image(grd_final)
##D 
## End(Not run)



