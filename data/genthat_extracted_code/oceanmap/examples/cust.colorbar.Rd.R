library(oceanmap)


### Name: cust.colorbar
### Title: defines colorbar settings for 'v.raster' and 'add.region'-calls.
### Aliases: cust.colorbar
### Keywords: internal

### ** Examples

## Example:
path <- system.file("test_files", package="oceanmap")
nfiles <- Sys.glob(paste0(path,'/herring*.nc')) # load sample-'.nc'-files
head(nfiles)
rfile <- nc2raster(nfiles[1], varname='Conc', layer=1)

ext <- extent(rfile)
#cb <- cust.colorbar(ext) # starts new plot device to define colorbar placement
#cust.colorbar(ext, cbx=cb$cbx, cby=cb$cby) # if cbx and cby are given no figure is produced

#plotmap(ext)
#set.colorbar(cb$cbx, cb$cby) # plots to an existing plot



