library(geometa)


### Name: ISOCitation
### Title: ISOCitation
### Aliases: ISOCitation
### Keywords: ISO citation

### ** Examples

 #create ISOCitation
 md <- ISOCitation$new()
 md$setTitle("sometitle")
 md$setEdition("1.0")
 md$setEditionDate(ISOdate(2015,1,1))
 md$setIdentifier(ISOMetaIdentifier$new(code = "identifier"))
 md$setPresentationForm("mapDigital")
 
 #add a cited responsible party
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
 md$setCitedResponsibleParty(rp)
 xml <- md$encode()
 



