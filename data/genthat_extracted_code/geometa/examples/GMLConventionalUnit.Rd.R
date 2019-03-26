library(geometa)


### Name: GMLConventionalUnit
### Title: GMLConventionalUnit
### Aliases: GMLConventionalUnit
### Keywords: GML ISO conventional definition unit

### ** Examples

   gml <- GMLConventionalUnit$new()
   gml$setDescriptionReference("someref")
   gml$setIdentifier("identifier", "codespace")
   gml$addName("name1", "codespace")
   gml$addName("name2", "codespace")
   gml$setQuantityTypeReference("someref")
   gml$setCatalogSymbol("symbol")
   gml$addDerivationUnitTerm("uomId", 2L)
   gml$setConversionToPreferredUnit("uomId", 2L)




