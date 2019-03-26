library(geometa)


### Name: ISOFeatureCatalogue
### Title: ISOFeatureCatalogue
### Aliases: ISOFeatureCatalogue
### Keywords: ISO catalogue feature

### ** Examples

 fc <- ISOFeatureCatalogue$new(uuid = "my-fc-identifier")
 fc$setName("name")
 fc$addScope("scope1")
 fc$addScope("scope2")
 fc$addFieldOfApplication("field1")
 fc$addFieldOfApplication("field2")
 fc$setVersionNumber("1.0")
 fc$setVersionDate(ISOdate(2015, 1, 1, 1))
 
 producer <- ISOResponsibleParty$new()
 producer$setIndividualName("someone")
 fc$setProducer(producer)
 fc$setFunctionalLanguage("eng")
 
 cit <- ISOCitation$new()
 cit$setTitle("some citation title")
 fc$addDefinitionSource(cit)
 #'  #add featureType
 ft <- ISOFeatureType$new()
 ft$setTypeName("typeName")
 ft$setDefinition("definition")
 ft$setCode("code")
 ft$setIsAbstract(FALSE)
 ft$addAlias("alias1")
 ft$addAlias("alias2")
 
 #add feature attributes
 for(i in 1:3){
   #create attribute
   fat <- ISOFeatureAttribute$new()
   fat$setMemberName(sprintf("name %s",i))
   fat$setDefinition(sprintf("definition %s",i))
   fat$setCardinality(lower=1,upper=1)
   fat$setCode(sprintf("code %s",i))
   
   gml <- GMLBaseUnit$new(id = sprintf("ID%s",i))
   gml$setDescriptionReference("someref")
   gml$setIdentifier("identifier", "codespace")
   gml$addName("name1", "codespace")
   gml$addName("name2", "codespace")
   gml$setQuantityTypeReference("someref")
   gml$setCatalogSymbol("symbol")
   gml$setUnitsSystem("somelink")
   fat$setValueMeasurementUnit(gml)
   
   #add listed values
   val1 <- ISOListedValue$new()
   val1$setCode("code1")
   val1$setLabel("label1")
   val1$setDefinition("definition1")
   fat$addListedValue(val1)
   val2 <- ISOListedValue$new()
   val2$setCode("code2")
   val2$setLabel("label2")
   val2$setDefinition("definition2")
   fat$addListedValue(val2)
   fat$setValueType("typeName")
   
   #add feature attribute as carrierOfCharacteristic
   ft$addCharacteristic(fat)
 }
 #add featureType to catalogue
 fc$addFeatureType(ft)
 
 xml <- fc$encode()
 



