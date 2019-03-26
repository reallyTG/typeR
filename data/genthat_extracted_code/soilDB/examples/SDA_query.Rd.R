library(soilDB)


### Name: SDA_query
### Title: Soil Data Access Query
### Aliases: SDA_query format_SQL_in_statement
### Keywords: manip

### ** Examples

## Not run: 
##D 
##D 
##D ## get SSURGO export date for all soil survey areas in California
##D # there is no need to filter STATSGO 
##D # because we are filtering on SSURGO areasymbols
##D q <- "SELECT areasymbol, saverest FROM sacatalog WHERE areasymbol LIKE 'CA%';"
##D x <- SDA_query(q)
##D head(x)
##D 
##D 
##D ## get SSURGO component data associated with the 
##D ## Amador series / major component only
##D # this query must explicitly filter out STATSGO data
##D q <- "SELECT cokey, compname, comppct_r 
##D FROM legend
##D INNER JOIN mapunit mu ON mu.lkey = legend.lkey
##D INNER JOIN component co ON mu.mukey = co.mukey 
##D WHERE 
##D -- critical: filter out STATSGO data
##D legend.areasymbol != 'US'
##D AND compname = 'Amador' ;"
##D 
##D res <- SDA_query(q)
##D str(res)
##D 
##D 
##D ## get component-level data for a specific soil survey area (Yolo county, CA)
##D # there is no need to filter STATSGO because the query contains
##D # an implicit selection of SSURGO data by areasymbol
##D q <- "SELECT 
##D component.mukey, cokey, comppct_r, compname, taxclname, 
##D taxorder, taxsuborder, taxgrtgroup, taxsubgrp
##D FROM legend
##D INNER JOIN mapunit ON mapunit.lkey = legend.lkey
##D LEFT OUTER JOIN component ON component.mukey = mapunit.mukey
##D WHERE legend.areasymbol = 'CA113' ;"
##D 
##D res <- SDA_query(q)
##D str(res)
##D 
##D 
##D ## get tabular data based on result from spatial query
##D # there is no need to filter STATSGO because
##D # SDA_Get_Mukey_from_intersection_with_WktWgs84() implies SSURGO
##D #
##D # requires raster and rgeos packages because
##D library(raster) # suggested by soilDB
##D library(rgeos)  # additional
##D 
##D # text -> bbox -> WKT
##D # xmin, xmax, ymin, ymax
##D b <- c(-120.9, -120.8, 37.7, 37.8)
##D p <- writeWKT(as(extent(b), 'SpatialPolygons'))
##D q <- paste0("SELECT mukey, cokey, compname, comppct_r
##D             FROM component 
##D             WHERE mukey IN (
##D             SELECT DISTINCT mukey 
##D             FROM SDA_Get_Mukey_from_intersection_with_WktWgs84('", p, "') 
##D             )
##D             ORDER BY mukey, cokey, comppct_r DESC")
##D 
##D x <- SDA_query(q)
##D str(x)
## End(Not run)






