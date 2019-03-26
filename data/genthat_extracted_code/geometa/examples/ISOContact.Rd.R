library(geometa)


### Name: ISOContact
### Title: ISOContact
### Aliases: ISOContact
### Keywords: ISO contact

### ** Examples

 md <- ISOContact$new()
 phone <- ISOTelephone$new()
 phone$setVoice("myphonenumber")
 phone$setFacsimile("myfacsimile")
 md$setPhone(phone)
 address <- ISOAddress$new()
 address$setDeliveryPoint("theaddress")
 address$setCity("thecity")
 address$setPostalCode("111")
 address$setCountry("France")
 address$setEmail("someone@theorg.org")
 md$setAddress(address)
 res <- ISOOnlineResource$new()
 res$setLinkage("http://www.somewhereovertheweb.org")
 res$setName("somename")
 md$setOnlineResource(res)
 xml <- md$encode()
 



