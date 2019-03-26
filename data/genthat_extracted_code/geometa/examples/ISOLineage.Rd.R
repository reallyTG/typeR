library(geometa)


### Name: ISOLineage
### Title: ISOLineage
### Aliases: ISOLineage
### Keywords: ISO lineage

### ** Examples

  lineage <- ISOLineage$new()
  lineage$setStatement("statement")
  
  #add a process step
  ps <- ISOProcessStep$new()
  ps$setDescription("description")
  ps$setRationale("rationale")
  ps$setDateTime( ISOdate(2015, 1, 1, 23, 59, 59))
  rp <- ISOResponsibleParty$new()
  rp$setIndividualName("someone") #and more responsible party properties..
  ps$addProcessor(rp)
  lineage$addProcessStep(ps)
  
  #add a source
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
  lineage$addSource(src)
  
  xml <- lineage$encode()
  



