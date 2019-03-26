library(geometa)


### Name: ISODistributor
### Title: ISODistributor
### Aliases: ISODistributor
### Keywords: ISO distributor

### ** Examples

   md <- ISODistributor$new()
   rp <- ISOResponsibleParty$new()
   rp$setIndividualName("someone")
   rp$setOrganisationName("somewhere")
   rp$setPositionName("Data manager")
   
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
   rp$setRole("author")
   md$setContact(rp)
   
   format <- ISOFormat$new()
   format$setName("name")
   format$setVersion("1.0")
   format$setAmendmentNumber("2")
   format$setSpecification("specification")
   md$addFormat(format)
   
   xml <- md$encode()
 



