library(spocc)


### Name: occ
### Title: Search for species occurrence data across many data sources.
### Aliases: occ

### ** Examples

## Not run: 
##D # Single data sources
##D (res <- occ(query = 'Accipiter striatus', from = 'gbif', limit = 5))
##D res$gbif
##D (res <- occ(query = 'Accipiter', from = 'ecoengine', limit = 50))
##D res$ecoengine
##D (res <- occ(query = 'Accipiter striatus', from = 'ebird', limit = 50))
##D res$ebird
##D (res <- occ(query = 'Danaus plexippus', from = 'inat', limit = 50))
##D res$inat
##D (res <- occ(query = 'Bison bison', from = 'bison', limit = 50))
##D res$bison
##D (res <- occ(query = 'Bison bison', from = 'vertnet', limit = 5))
##D res$vertnet
##D res$vertnet$data$Bison_bison
##D occ2df(res)
##D 
##D # Paging
##D one <- occ(query = 'Accipiter striatus', from = 'gbif', limit = 5)
##D two <- occ(query = 'Accipiter striatus', from = 'gbif', limit = 5, start = 5)
##D one$gbif
##D two$gbif
##D 
##D 
##D # Date range searches across data sources
##D ## Not possible for ebird
##D ## bison
##D occ(query = 'Acer', date = c('2010-08-08', '2010-08-21'), from = 'bison', limit=5)
##D ## ala
##D occ(date = c('2018-01-01T00:00:00Z', '2018-03-28T00:00:00Z'), from = 'ala', limit = 5)
##D ## gbif
##D occ(query = 'Accipiter striatus', date = c('2010-08-01', '2010-08-31'), from = 'gbif', limit=5)
##D # ecoengine
##D occ(date = c('2010-01-01', '2010-12-31'), from = 'ecoengine', limit=5)
##D ## vertnet
##D occ(query = 'Mustela nigripes', date = c('1990-01-01', '2015-12-31'), from = 'vertnet', limit=5)
##D ## idigbio
##D occ(query = 'Acer', date = c('2010-01-01', '2015-12-31'), from = 'idigbio', limit=5)
##D ## obis
##D occ(query = 'Mola mola', date = c('2015-01-01', '2015-12-31'), from = 'obis', limit=5)
##D ## inat
##D occ(query = 'Danaus plexippus', date = c('2015-01-01', '2015-12-31'), from = 'inat', limit=5)
##D 
##D 
##D # Restrict to records with coordinates
##D occ(query = "Acer", from = "idigbio", limit = 5, has_coords = TRUE)
##D 
##D occ(query = 'Setophaga caerulescens', from = 'ebird', ebirdopts = list(loc='US'))
##D occ(query = 'Spinus tristis', from = 'ebird', ebirdopts =
##D    list(method = 'ebirdgeo', lat = 42, lng = -76, dist = 50))
##D 
##D # idigbio data
##D ## scientific name search
##D occ(query = "Acer", from = "idigbio", limit = 5)
##D occ(query = "Acer", from = "idigbio", idigbioopts = list(offset = 5, limit  = 3))
##D ## geo search
##D bounds <- c(-120, 40, -100, 45)
##D occ(from = "idigbio", geometry = bounds, limit = 10)
##D ## just class arachnida, spiders
##D occ(idigbioopts = list(rq = list(class = 'arachnida')), from = "idigbio", limit = 10)
##D ## search certain recordsets
##D sets <- c("1ffce054-8e3e-4209-9ff4-c26fa6c24c2f",
##D     "8dc14464-57b3-423e-8cb0-950ab8f36b6f", 
##D     "26f7cbde-fbcb-4500-80a9-a99daa0ead9d")
##D occ(idigbioopts = list(rq = list(recordset = sets)), from = "idigbio", limit = 10)
##D 
##D # You can pass on limit param to all sources even though its a different param in that source
##D ## ecoengine example
##D res <- occ(query = 'Accipiter striatus', from = 'ecoengine', ecoengineopts=list(limit = 5))
##D res$ecoengine
##D ## This is particularly useful when you want to set different limit for each source
##D (res <- occ(query = 'Accipiter striatus', from = c('gbif','ecoengine'),
##D    gbifopts=list(limit = 10), ecoengineopts=list(limit = 5)))
##D 
##D # Many data sources
##D (out <- occ(query = 'Pinus contorta', from=c('gbif','bison','vertnet'), limit=10))
##D 
##D ## Select individual elements
##D out$gbif
##D out$gbif$data
##D out$vertnet
##D 
##D ## Coerce to combined data.frame, selects minimal set of
##D ## columns (name, lat, long, provider, date, occurrence key)
##D occ2df(out)
##D 
##D # Pass in limit parameter to all sources. This limits the number of occurrences
##D # returned to 10, in this example, for all sources, in this case gbif and inat.
##D occ(query='Pinus contorta', from=c('gbif','inat'), limit=10)
##D 
##D # Geometry
##D ## Pass in geometry parameter to all sources. This constraints the search to the
##D ## specified polygon for all sources, gbif and bison in this example.
##D ## Check out http://arthur-e.github.io/Wicket/sandbox-gmaps3.html to get a WKT string
##D occ(query='Accipiter', from='gbif',
##D    geometry='POLYGON((30.1 10.1, 10 20, 20 60, 60 60, 30.1 10.1))')
##D occ(query='Helianthus annuus', from='bison', limit=50,
##D    geometry='POLYGON((-111.06 38.84, -110.80 39.37, -110.20 39.17, -110.20 38.90,
##D                       -110.63 38.67, -111.06 38.84))')
##D 
##D ## Or pass in a bounding box, which is automatically converted to WKT (required by GBIF)
##D ## via the bbox2wkt function. The format of a bounding box is
##D ## [min-longitude, min-latitude, max-longitude, max-latitude].
##D occ(query='Accipiter striatus', from='gbif', geometry=c(-125.0,38.4,-121.8,40.9))
##D 
##D ## Bounding box constraint with ecoengine
##D ## Use this website: http://boundingbox.klokantech.com/ to quickly grab a bbox.
##D ## Just set the format on the bottom left to CSV.
##D occ(query='Accipiter striatus', from='ecoengine', limit=10,
##D    geometry=c(-125.0,38.4,-121.8,40.9))
##D 
##D ## lots of results, can see how many by indexing to meta
##D res <- occ(query='Accipiter striatus', from='gbif',
##D    geometry='POLYGON((-69.9 49.2,-69.9 29.0,-123.3 29.0,-123.3 49.2,-69.9 49.2))')
##D res$gbif
##D 
##D ## You can pass in geometry to each source separately via their opts parameter, at
##D ## least those that support it. Note that if you use rinat, you reverse the order, with
##D ## latitude first, and longitude second, but here it's the reverse for consistency across
##D ## the spocc package
##D bounds <- c(-125.0,38.4,-121.8,40.9)
##D occ(query = 'Danaus plexippus', from="inat", geometry=bounds)
##D 
##D ## Passing geometry with multiple sources
##D occ(query = 'Danaus plexippus', from=c("inat","gbif","ecoengine"), geometry=bounds)
##D 
##D ## Using geometry only for the query
##D ### A single bounding box
##D occ(geometry = bounds, from = "gbif", limit=50)
##D ### Many bounding boxes
##D occ(geometry = list(c(-125.0,38.4,-121.8,40.9), c(-115.0,22.4,-111.8,30.9)), from = "gbif")
##D 
##D ## Many geometry and many names
##D res <- occ(query = c('Danaus plexippus', 'Accipiter striatus'),
##D    geometry = list(c(-125.0,38.4,-121.8,40.9), c(-115.0,22.4,-111.8,30.9)), from = "bison")
##D res
##D 
##D ## Geometry only with WKT
##D wkt <- 'POLYGON((-98.9 44.2,-89.1 36.6,-116.7 37.5,-102.5 39.6,-98.9 44.2))'
##D occ(from = "gbif", geometry = wkt, limit = 10)
##D 
##D # Specify many data sources, another example
##D ebirdopts = list(loc = 'US'); gbifopts  =  list(country = 'US')
##D out <- occ(query = 'Setophaga caerulescens', from = c('gbif','inat','bison','ebird'),
##D     gbifopts = gbifopts, ebirdopts = ebirdopts, limit=20)
##D occ2df(out)
##D 
##D # Pass in many species names, combine just data to a single data.frame, and
##D # first six rows
##D spnames <- c('Accipiter striatus', 'Setophaga caerulescens', 'Spinus tristis')
##D (out <- occ(query = spnames, from = 'gbif', gbifopts = list(hasCoordinate = TRUE), limit=25))
##D df <- occ2df(out)
##D head(df)
##D 
##D # no query, geometry, or ids passed
##D ## many dataset keys to gbif
##D dsets <- c("14f3151a-e95d-493c-a40d-d9938ef62954", "f934f8e2-32ca-46a7-b2f8-b032a4740454")
##D occ(limit = 20, from = "gbif", gbifopts = list(datasetKey = dsets))
##D ## class name to idigbio
##D occ(limit = 20, from = "idigbio", idigbioopts = list(rq = list(class = 'arachnida')))
##D ## limit to ecoengine
##D occ(from = "ecoengine", ecoengineopts = list(limit = 3))
##D 
##D # taxize integration
##D ## You can pass in taxonomic identifiers
##D library("taxize")
##D (ids <- get_ids(names=c("Chironomus riparius","Pinus contorta"), db = c('itis','gbif')))
##D occ(ids = ids[[1]], from='bison', limit=20)
##D occ(ids = ids, from=c('bison','gbif'), limit=20)
##D 
##D (ids <- get_ids(names="Chironomus riparius", db = 'gbif'))
##D occ(ids = ids, from='gbif', limit=20)
##D 
##D (ids <- get_gbifid("Chironomus riparius"))
##D occ(ids = ids, from='gbif', limit=20)
##D 
##D (ids <- get_tsn('Accipiter striatus'))
##D occ(ids = ids, from='bison', limit=20)
##D 
##D # SpatialPolygons/SpatialPolygonsDataFrame integration
##D library("sp")
##D ## Single polygon in SpatialPolygons class
##D one <- Polygon(cbind(c(91,90,90,91), c(30,30,32,30)))
##D spone = Polygons(list(one), "s1")
##D sppoly = SpatialPolygons(list(spone), as.integer(1))
##D out <- occ(geometry = sppoly, limit=50)
##D out$gbif$data
##D 
##D ## Two polygons in SpatialPolygons class
##D one <- Polygon(cbind(c(-121.0,-117.9,-121.0,-121.0), c(39.4, 37.1, 35.1, 39.4)))
##D two <- Polygon(cbind(c(-123.0,-121.2,-122.3,-124.5,-123.5,-124.1,-123.0),
##D                      c(44.8,42.9,41.9,42.6,43.3,44.3,44.8)))
##D spone = Polygons(list(one), "s1")
##D sptwo = Polygons(list(two), "s2")
##D sppoly = SpatialPolygons(list(spone, sptwo), 1:2)
##D out <- occ(geometry = sppoly, limit=50)
##D out$gbif$data
##D 
##D ## Two polygons in SpatialPolygonsDataFrame class
##D sppoly_df <- SpatialPolygonsDataFrame(sppoly, 
##D    data.frame(a=c(1,2), b=c("a","b"), c=c(TRUE,FALSE),
##D    row.names=row.names(sppoly)))
##D out <- occ(geometry = sppoly_df, limit=50)
##D out$gbif$data
##D 
##D # curl debugging
##D library('httr')
##D occ(query = 'Accipiter striatus', from = 'gbif', limit=10, 
##D  callopts=list(verbose = TRUE))
##D occ(query = 'Accipiter striatus', from = 'bison', limit=10, 
##D  callopts=list(verbose = TRUE))
##D occ(query = 'Accipiter striatus', from = 'ecoengine', limit=10, 
##D  callopts=list(verbose = TRUE))
##D occ(query = 'Accipiter striatus', from = 'inat', 
##D  callopts=list(verbose = TRUE))
##D occ(query = 'Mola mola', from = 'obis', limit = 200, 
##D  callopts = list(verbose = TRUE))
##D 
##D ########## More thorough data source specific examples
##D # idigbio
##D ## scientific name search
##D res <- occ(query = "Acer", from = "idigbio", limit = 5)
##D res$idigbio
##D 
##D ## geo search
##D ### bounding box
##D bounds <- c(-120, 40, -100, 45)
##D occ(from = "idigbio", geometry = bounds, limit = 10)
##D ### wkt
##D # wkt <- 'POLYGON((-69.9 49.2,-69.9 29.0,-123.3 29.0,-123.3 49.2,-69.9 49.2))'
##D wkt <- 'POLYGON((-98.9 44.2,-89.1 36.6,-116.7 37.5,-102.5 39.6,-98.9 44.2))'
##D occ(from = "idigbio", geometry = wkt, limit = 10)
##D 
##D ## limit fields returned
##D occ(query = "Acer", from = "idigbio", limit = 5,
##D    idigbioopts = list(fields = "scientificname"))
##D 
##D ## offset and max_items
##D occ(query = "Acer", from = "idigbio", limit = 5,
##D    idigbioopts = list(offset = 10))
##D 
##D ## sort
##D occ(query = "Acer", from = "idigbio", limit = 5,
##D    idigbioopts = list(sort = TRUE))$idigbio
##D occ(query = "Acer", from = "idigbio", limit = 5,
##D    idigbioopts = list(sort = FALSE))$idigbio
##D 
##D ## more complex queries
##D ### parameters passed to "rq", get combined with the name queried
##D occ(query = "Acer", from = "idigbio", limit = 5,
##D    idigbioopts = list(rq = list(basisofrecord="fossilspecimen")))$idigbio
##D 
##D #### NOTE: no support for multipolygons yet
##D ## WKT's are more flexible than bounding box's. You can pass in a WKT with multiple
##D ## polygons like so (you can use POLYGON or MULTIPOLYGON) when specifying more than one
##D ## polygon. Note how each polygon is in it's own set of parentheses.
##D # occ(query='Accipiter striatus', from='gbif',
##D #    geometry='MULTIPOLYGON((30 10, 10 20, 20 60, 60 60, 30 10),
##D #                           (30 10, 10 20, 20 60, 60 60, 30 10))')
##D 
##D # OBIS examples
##D ## basic query
##D (res <- occ(query = 'Mola mola', from = 'obis', limit = 200))
##D ## get to obis data
##D res$obis
##D ## get obis + gbif data
##D (res <- occ(query = 'Mola mola', from = c('obis', 'gbif'), limit = 200))
##D res$gbif
##D res$obis
##D ## no match found
##D (res <- occ(query = 'Linguimaera thomsonia', from = 'obis'))
##D ## geometry query
##D geometry <- "POLYGON((8.98 48.05,15.66 48.05,15.66 45.40,8.98 45.40,8.98 48.05))"
##D (res <- occ(from = 'obis', geometry = geometry, limit = 50))
##D res$obis
##D ## Pass in spatial classes
##D library("sp")
##D one <- Polygon(cbind(c(45,30,30,45), c(35,35,30,30)))
##D spone = Polygons(list(one), "s1")
##D sppoly = SpatialPolygons(list(spone), as.integer(1))
##D (res <- occ(from = 'obis', geometry = sppoly, limit = 50))
##D ## Do paging
##D (res1 <- occ(query = 'Mola mola', from = 'obis', limit = 10))
##D (res2 <- occ(query = 'Mola mola', from = 'obis', limit = 10, start = 20))
##D res1$obis
##D res2$obis
##D ## Pass in any occurrence route parameters to obisopts as a list
##D (res <- occ(query = 'Mola mola', from = 'obis', 
##D    obisopts = list(year = 2005)))
##D unique(res$obis$data$Mola_mola$yearcollected)
##D 
##D 
##D # ALA examples
##D ## basic query
##D (res <- occ(query = 'Alaba vibex', from = 'ala', limit = 200))
##D ## get to ala data
##D res$ala
##D occ2df(res)
##D 
##D # geometry search
##D (x <- occ(query = "Macropus", from = 'ala',
##D   geometry = "POLYGON((145 -37,150 -37,150 -30,145 -30,145 -37))"))
##D x$ala
##D occ2df(x)
## End(Not run)



