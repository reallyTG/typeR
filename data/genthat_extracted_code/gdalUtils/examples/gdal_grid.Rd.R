library(gdalUtils)


### Name: gdal_grid
### Title: gdal_grid
### Aliases: gdal_grid

### ** Examples

# We'll pre-check to make sure there is a valid GDAL install
# and that raster and rgdal are also installed.
# Note this isn't strictly neccessary, as executing the function will
# force a search for a valid GDAL install.
gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(require(raster) && valid_install)
{
	# Create a properly formatted CSV:
	temporary_dir <- tempdir()
	tempfname_base <- file.path(temporary_dir,"dem")
	tempfname_csv <- paste(tempfname_base,".csv",sep="")
	
	pts <- data.frame(
			Easting=c(86943.4,87124.3,86962.4,87077.6),
			Northing=c(891957,892075,892321,891995),
			Elevation=c(139.13,135.01,182.04,135.01)
	)
	
	write.csv(pts,file=tempfname_csv,row.names=FALSE)
	
	# Now make a matching VRT file
	tempfname_vrt <- paste(tempfname_base,".vrt",sep="")
	vrt_header <- c(
	'<OGRVRTDataSource>',
	'\t<OGRVRTLayer name="dem">',
	'\t<SrcDataSource>dem.csv</SrcDataSource>',
	'\t<GeometryType>wkbPoint</GeometryType>', 
 '\t<GeometryField encoding="PointFromColumns" x="Easting" y="Northing" z="Elevation"/>',
	'\t</OGRVRTLayer>',
	'\t</OGRVRTDataSource>'			
	)
	vrt_filecon <- file(tempfname_vrt,"w")
	writeLines(vrt_header,con=vrt_filecon)
	close(vrt_filecon)

	tempfname_tif <- paste(tempfname_base,".tiff",sep="")
	
	# Now run gdal_grid:
	setMinMax(gdal_grid(src_datasource=tempfname_vrt,
		dst_filename=tempfname_tif,a="invdist:power=2.0:smoothing=1.0",
		txe=c(85000,89000),tye=c(894000,890000),outsize=c(400,400),
		of="GTiff",ot="Float64",l="dem",output_Raster=TRUE))
}



