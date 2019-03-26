library(geometa)


### Name: ISOSource
### Title: ISOSource
### Aliases: ISOSource
### Keywords: ISO source

### ** Examples

  src <- ISOSource$new()
  src$setDescription("description")
  src$setScaleDenominator(1L)
  
  rs <- ISOReferenceSystem$new()
  rsId <- ISOReferenceIdentifier$new(code = "4326", codeSpace = "EPSG")
  rs$setReferenceSystemIdentifier(rsId)
  src$setReferenceSystem(rs)
  
  cit <- ISOCitation$new()
  cit$setTitle("sometitle") #and more citation properties...
  src$setCitation(cit)
  
  extent <- ISOExtent$new()
  bbox <- ISOGeographicBoundingBox$new(minx = -180, miny = -90, maxx = 180, maxy = 90)
  extent$setGeographicElement(bbox)
  src$addExtent(extent)
  xml <- src$encode()
  



