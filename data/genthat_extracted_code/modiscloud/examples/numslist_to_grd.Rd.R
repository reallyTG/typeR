library(modiscloud)


### Name: numslist_to_grd
### Title: Convert a list of numbers to a grid
### Aliases: numslist_to_grd

### ** Examples

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
##D install_url(url="https://github.com/nmatzke/modiscdata/archive/master.zip")
##D library(modiscdata)
##D tifsdir = system.file("extdata/2002_bit/", package="modiscdata")
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
##D # Note: Don't run the double-commented lines unless you want to collapse different bit values.
##D 	# grdr_clear = grdr_vals
##D 	# grdr_clear[grdr_vals == 4] = 0
##D 	# grdr_clear[grdr_vals == 3] = 1
##D 	# grdr_clear[grdr_vals == 2] = 1
##D 	# grdr_clear[grdr_vals == 1] = 1
##D 	# grdr_clear[grdr_vals == 0] = 0
##D 	#
##D 
##D if (j == 1)
##D 	{
##D 	sum_cloudy = grdr_cloudy
##D 	#sum_not_cloudy = grdr_clear
##D 	sum_data = data_grdr
##D 	} else {
##D 	sum_cloudy = sum_cloudy + grdr_cloudy
##D 	sum_data = sum_data + data_grdr
##D 	}
##D 
##D 	}
##D 
##D 
##D ## Calculate percentage cloudy
##D sum_nums = sum_cloudy / sum_data
##D 
##D grd_final = numslist_to_grd(numslist=sum_nums, grd=grd, ydim_new=ydim_new, xdim_new=xdim_new)
##D 
##D # Display the image (this is just the sum of a few images)
##D image(grd_final)
##D 
## End(Not run)



