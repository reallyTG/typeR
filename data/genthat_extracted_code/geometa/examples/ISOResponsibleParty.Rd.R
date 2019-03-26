library(geometa)


### Name: ISOResponsibleParty
### Title: ISOResponsibleParty
### Aliases: ISOResponsibleParty
### Keywords: ISO file identifier

### ** Examples

  #create a responsible party element
  md <- ISOResponsibleParty$new()
  md$setIndividualName("someone")
  md$setOrganisationName("somewhere")
  md$setPositionName("someposition")
  md$setRole("pointOfContact")
  
  #add contact
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
  md$setContactInfo(contact)
  
  xml <- md$encode()
  



