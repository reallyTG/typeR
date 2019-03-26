library(geometa)


### Name: ISOExtendedElementInformation
### Title: ISOExtendedElementInformation
### Aliases: ISOExtendedElementInformation
### Keywords: ISO element extended information

### ** Examples

  md <- ISOExtendedElementInformation$new()
  md$setName("name")
  md$setShortName("shortName")
  md$setDomainCode(1L)
  md$setDefinition("some definition")
  md$setObligation("mandatory")
  md$setCondition("no condition")
  md$setDatatype("characterString")
  md$setMaximumOccurrence("string")
  md$setDomainValue("value")
  md$addParentEntity("none")
  md$setRule("rule")
  md$addRationale("rationale")
  
  #adding a source
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
  
  md$addSource(rp)
  
  xml <- md$encode()
  



