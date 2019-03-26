library(geojson)


### Name: ndgeo
### Title: Read and write newline-delimited GeoJSON (GeoJSON text
###   sequences)
### Aliases: ndgeo ndgeo_write ndgeo_write.default
###   ndgeo_write.geofeaturecollection ndgeo_write.geofeature ndgeo_read

### ** Examples

# featurecollection
## write
file <- system.file("examples", 'featurecollection2.geojson',
  package = "geojson")
str <- paste0(readLines(file), collapse = " ")
(x <- featurecollection(str))
outfile <- tempfile(fileext = ".geojson")
ndgeo_write(x, outfile)
readLines(outfile)
jsonlite::stream_in(file(outfile))
## read
ndgeo_read(outfile)
unlink(outfile)

# read from an existing file
## GeoJSON objects all of same type: Feature
file <- system.file("examples", 'ndgeojson1.json', package = "geojson")
ndgeo_read(file)
## GeoJSON objects all of same type: Point
file <- system.file("examples", 'ndgeojson2.json', package = "geojson")
ndgeo_read(file)
## GeoJSON objects of mixed type: Point, and Feature
file <- system.file("examples", 'ndgeojson3.json', package = "geojson")
ndgeo_read(file)

## Not run: 
##D # read from a file
##D url <- "https://storage.googleapis.com/osm-extracts.interline.io/honolulu_hawaii.geojsonl"
##D f <- tempfile(fileext = ".geojsonl")
##D download.file(url, f)
##D x <- ndgeo_read(f)
##D x
##D unlink(f)
##D 
##D # read from a URL
##D url <- "https://storage.googleapis.com/osm-extracts.interline.io/honolulu_hawaii.geojsonl"
##D x <- ndgeo_read(url)
##D x
##D 
##D # geojson text sequences from file
##D file <- system.file("examples", 'featurecollection2.geojson',
##D   package = "geojson")
##D str <- paste0(readLines(file), collapse = " ")
##D x <- featurecollection(str)
##D outfile <- tempfile(fileext = ".geojson")
##D ndgeo_write(x, outfile, sep = "\u001e\n")
##D con <- file(outfile)
##D readLines(con)
##D close(con)
##D ndgeo_read(outfile)
##D unlink(outfile)
## End(Not run)



