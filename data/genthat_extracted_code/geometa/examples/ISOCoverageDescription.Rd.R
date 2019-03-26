library(geometa)


### Name: ISOCoverageDescription
### Title: ISOCoverageDescription
### Aliases: ISOCoverageDescription
### Keywords: ISO coverage description

### ** Examples

   #create coverage description
   md <- ISOCoverageDescription$new()
   md$setAttributeDescription("test")
   md$setContentType("modelResult")
   
   #adding 3 arbitrary dimensions
   for(i in 1:3){
      band <- ISOBand$new()
      mn <- ISOMemberName$new(aName = sprintf("name %s",i), attributeType = sprintf("type %s",i))
      band$setSequenceIdentifier(mn)
      band$setDescriptor("descriptor")
      band$setMaxValue(10)
      band$setMinValue(1)
      gml <- GMLBaseUnit$new(id = sprintf("ID%s",i))
      gml$setDescriptionReference("someref")
      gml$setIdentifier("identifier", "codespace")
      gml$addName("name1", "codespace")
      gml$addName("name2", "codespace")
      gml$setQuantityTypeReference("someref")
      gml$setCatalogSymbol("symbol")
      gml$setUnitsSystem("somelink")
      band$setUnits(gml)
      band$setPeakResponse(9)
      band$setBitsPerValue(5)
      band$setToneGradation(100)
      band$setScaleFactor(1)
      band$setOffset(4)
      md$addDimension(band)
   }
   xml <- md$encode()
   



