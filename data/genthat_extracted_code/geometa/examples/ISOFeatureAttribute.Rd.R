library(geometa)


### Name: ISOFeatureAttribute
### Title: ISOFeatureAttribute
### Aliases: ISOFeatureAttribute
### Keywords: ISO feature operation

### ** Examples

  md <- ISOFeatureAttribute$new()
  md$setMemberName("name")
  md$setDefinition("definition")
  md$setCardinality(lower=1,upper=1)
  md$setCode("code")
  
  gml <- GMLBaseUnit$new(id = "ID")
  gml$setDescriptionReference("someref")
  gml$setIdentifier("identifier", "codespace")
  gml$addName("name1", "codespace")
  gml$addName("name2", "codespace")
  gml$setQuantityTypeReference("someref")
  gml$setCatalogSymbol("symbol")
  gml$setUnitsSystem("somelink")
  md$setValueMeasurementUnit(gml)
  
  val1 <- ISOListedValue$new()
  val1$setCode("code1")
  val1$setLabel("label1")
  val1$setDefinition("definition1")
  md$addListedValue(val1)
  val2 <- ISOListedValue$new()
  val2$setCode("code2")
  val2$setLabel("label2")
  val2$setDefinition("definition2")
  md$addListedValue(val2)
  md$setValueType("typeName")
 



