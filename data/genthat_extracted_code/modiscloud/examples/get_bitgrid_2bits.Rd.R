library(modiscloud)


### Name: get_bitgrid_2bits
### Title: extract the value of 2 particular bits at each pixel
### Aliases: get_bitgrid_2bits

### ** Examples

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
##D install_url(url="https://github.com/nmatzke/modiscdata/archive/master.zip")
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
##D # Extract a particular pair of bits for all the pixels in the grid
##D #######################################################
##D bitnum = 2
##D grdr_vals_bitstrings = get_bitgrid_2bits(grd, bitnum)
##D length(grdr_vals_bitstrings)
##D grdr_vals_bitstrings[1:50]
## End(Not run)



