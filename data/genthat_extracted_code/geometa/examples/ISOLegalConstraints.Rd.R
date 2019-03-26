library(geometa)


### Name: ISOLegalConstraints
### Title: ISOLegalConstraints
### Aliases: ISOLegalConstraints
### Keywords: ISO constraints legal

### ** Examples

  #create object
  md <- ISOLegalConstraints$new()
  md$addUseLimitation("limitation1")
  md$addUseLimitation("limitation2")
  md$addUseLimitation("limitation3")
  md$addAccessConstraint("copyright")
  md$addAccessConstraint("license")
  md$addUseConstraint("copyright")
  md$addUseConstraint("license")
  
  xml <- md$encode()
  



