library(geometa)


### Name: ISOFeatureCatalogueDescription
### Title: ISOFeatureCatalogueDescription
### Aliases: ISOFeatureCatalogueDescription
### Keywords: ISO catalogue description feature

### ** Examples

  md <- ISOFeatureCatalogueDescription$new()
  md$setComplianceCode(FALSE)
  md$addLanguage("eng")
  md$setIncludedWithDataset(FALSE)
  
  cit = ISOCitation$new()
  contact = ISOContact$new()
  fcLink <- ISOOnlineResource$new()
  fcLink$setLinkage("http://somelink/featurecatalogue")
  contact$setOnlineResource(fcLink)
  rp = ISOResponsibleParty$new()
  rp$setContactInfo(contact)
  cit$setCitedResponsibleParty(rp)
  md$addFeatureCatalogueCitation(cit)
 



