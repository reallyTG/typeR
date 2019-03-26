library(geometa)


### Name: GMLDerivedUnit
### Title: GMLDerivedUnit
### Aliases: GMLDerivedUnit
### Keywords: GML ISO definition derived unit

### ** Examples

  gml <- GMLDerivedUnit$new()
  gml$setDescriptionReference("someref")
  gml$setIdentifier("identifier", "codespace")
  gml$addName("name2", "codespace")
  gml$setQuantityTypeReference("someref")
  gml$setCatalogSymbol("symbol")
  gml$addDerivationUnitTerm("uomId", 2L)




