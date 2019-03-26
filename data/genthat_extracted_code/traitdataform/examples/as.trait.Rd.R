library(traitdataform)


### Name: as.trait
### Title: Create a trait definition
### Aliases: as.trait

### ** Examples


body_length <- as.trait("body_length", expectedUnit = "mm", valueType = "numeric",
  identifier = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Body_length",
  traitDescription = "The known longest dimension of the physical structure of organisms",
  relationSource = "Maggenti and Maggenti, 2005",
  broaderTerm = "http://t-sita.cesab.org/BETSI_vizInfo.jsp?trait=Body_dimension"
  )




