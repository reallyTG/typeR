library(geometa)


### Name: ISOGeographicDescription
### Title: ISOGeographicDescription
### Aliases: ISOGeographicDescription
### Keywords: ISO description geographic

### ** Examples

  md <- ISOGeographicDescription$new()
  md$setGeographicIdentifier(ISOMetaIdentifier$new(code = "identifier"))
  xml <- md$encode()




