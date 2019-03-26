library(geometa)


### Name: ISOProcessStep
### Title: ISOProcessStep
### Aliases: ISOProcessStep
### Keywords: ISO process step

### ** Examples

  ps <- ISOProcessStep$new()
  ps$setDescription("description")
  ps$setRationale("rationale")
  ps$setDateTime( ISOdate(2015, 1, 1, 23, 59, 59))
  rp <- ISOResponsibleParty$new()
  rp$setIndividualName("someone") #and more responsible party properties..
  ps$addProcessor(rp)
  xml <- ps$encode()
  



