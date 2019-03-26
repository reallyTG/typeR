library(geometa)


### Name: ISOBand
### Title: ISOBand
### Aliases: ISOBand
### Keywords: ISO band

### ** Examples

   #create band range dimension
   md <- ISOBand$new()
   md$setSequenceIdentifier(ISOMemberName$new(aName = "name", attributeType = "type"))
   md$setDescriptor("descriptor")
   md$setMaxValue(10)
   md$setMinValue(1)
   gml <- GMLBaseUnit$new(id = "ID")
   gml$setDescriptionReference("someref")
   gml$setIdentifier("identifier", "codespace")
   gml$addName("name1", "codespace")
   gml$addName("name2", "codespace")
   gml$setQuantityTypeReference("someref")
   gml$setCatalogSymbol("symbol")
   gml$setUnitsSystem("somelink")
   md$setUnits(gml)
   md$setPeakResponse(9)
   md$setBitsPerValue(5)
   md$setToneGradation(100)
   md$setScaleFactor(1)
   md$setOffset(4)
   xml <- md$encode()




