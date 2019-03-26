library(geometa)


### Name: ISOTelephone
### Title: ISOTelephone
### Aliases: ISOTelephone
### Keywords: ISO file identifier

### ** Examples

  md <- ISOTelephone$new()
  md$setVoice("myphonenumber")
  md$setFacsimile("myfacsimile")
  xml <- md$encode()
  



