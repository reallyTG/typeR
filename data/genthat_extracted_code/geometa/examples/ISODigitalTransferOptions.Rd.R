library(geometa)


### Name: ISODigitalTransferOptions
### Title: ISODigitalTransferOptions
### Aliases: ISODigitalTransferOptions
### Keywords: ISO distribution

### ** Examples

  md <- ISODigitalTransferOptions$new()  
  
  or <- ISOOnlineResource$new()
  or$setLinkage("http://somelink")
  or$setName("name")
  or$setDescription("description")
  or$setProtocol("WWW:LINK-1.0-http--link")
  md$addOnlineResource(or)
  
  xml <- md$encode()
  



