library(geometa)


### Name: ISOAddress
### Title: ISOAddress
### Aliases: ISOAddress
### Keywords: ISO address

### ** Examples

 md <- ISOAddress$new()
 md$setDeliveryPoint("theaddress")
 md$setCity("thecity")
 md$setPostalCode("111")
 md$setCountry("France")
 md$setEmail("someone@theorg.org")
 xml <- md$encode()
 



