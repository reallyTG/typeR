library(rnoaa)


### Name: storm_shp
### Title: Get NOAA wind storm tabular data, metadata, or shp files from
###   IBTrACS
### Aliases: storm_shp storm_shp_read storms storm_data storm_meta

### ** Examples

## Not run: 
##D # Metadata
##D head( storm_meta() )
##D head( storm_meta("storm_columns") )
##D head( storm_meta("storm_names") )
##D 
##D # Tabular data
##D ## Get tabular data for basins, storms, or years
##D storm_data(basin='WP')
##D storm_data(storm='1970143N19091')
##D storm_data(year=1940)
##D storm_data(year=1941)
##D storm_data(year=2010)
##D 
##D # shp files
##D ## storm_shp downloads data and gives a path back
##D ## to read in, use storm_shp_read
##D res <- storm_shp(basin='EP')
##D storm_shp_read(res)
##D 
##D ## Get shp file for a storm
##D (res2 <- storm_shp(storm='1970143N19091'))
##D 
##D ## Plot shp file data, we'll need sp library
##D library('sp')
##D 
##D ### for year 1940, points
##D (res3 <- storm_shp(year=1940))
##D res3shp <- storm_shp_read(res3)
##D plot(res3shp)
##D 
##D ### for year 1940, lines
##D (res3_lines <- storm_shp(year=1940, type="lines"))
##D res3_linesshp <- storm_shp_read(x=res3_lines)
##D plot(res3_linesshp)
##D 
##D ### for year 2010, points
##D (res4 <- storm_shp(year=2010))
##D res4shp <- storm_shp_read(res4)
##D plot(res4shp)
## End(Not run)



