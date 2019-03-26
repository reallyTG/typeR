library(geometa)


### Name: ISOMetadataExtensionInformation
### Title: ISOMetadataExtensionInformation
### Aliases: ISOMetadataExtensionInformation
### Keywords: ISO extension information metadata

### ** Examples

  #create an extended element information
  elem <- ISOExtendedElementInformation$new()
  elem$setName("name")
  elem$setShortName("shortName")
  elem$setDomainCode(1L)
  elem$setDefinition("some definition")
  elem$setObligation("mandatory")
  elem$setCondition("no condition")
  elem$setDatatype("characterString")
  elem$setMaximumOccurrence("string")
  elem$setDomainValue("value")
  elem$addParentEntity("none")
  elem$setRule("rule")
  elem$addRationale("rationale")
  rp <- ISOResponsibleParty$new()
  rp$setIndividualName("someone")
  rp$setOrganisationName("somewhere")
  rp$setPositionName("someposition")
  rp$setRole("pointOfContact")
  contact <- ISOContact$new()
  phone <- ISOTelephone$new()
  phone$setVoice("myphonenumber")
  phone$setFacsimile("myfacsimile")
  contact$setPhone(phone)
  address <- ISOAddress$new()
  address$setDeliveryPoint("theaddress")
  address$setCity("thecity")
  address$setPostalCode("111")
  address$setCountry("France")
  address$setEmail("someone@theorg.org")
  contact$setAddress(address)
  res <- ISOOnlineResource$new()
  res$setLinkage("http://www.somewhereovertheweb.org")
  res$setName("somename")
  contact$setOnlineResource(res)
  rp$setContactInfo(contact)
  elem$addSource(rp)
  
  md <- ISOMetadataExtensionInformation$new()
  md$addElement(elem)
  
  xml <- md$encode()
  



