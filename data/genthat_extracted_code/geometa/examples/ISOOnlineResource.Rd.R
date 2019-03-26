library(geometa)


### Name: ISOOnlineResource
### Title: ISOOnlineResource
### Aliases: ISOOnlineResource
### Keywords: ISO online resource

### ** Examples

  md <- ISOOnlineResource$new()
  md$setLinkage("http://somelink")
  md$setName("name")
  md$setDescription("description")
  md$setProtocol("protocol")
  md$setOnLineFunction("download")
  xml <- md$encode()
  



