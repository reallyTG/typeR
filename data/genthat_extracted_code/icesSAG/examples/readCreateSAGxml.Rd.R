library(icesSAG)


### Name: convertSAGxml
### Title: Create and read the SAG XML data transfer file
### Aliases: convertSAGxml createSAGxml readSAGxml

### ** Examples


info <- stockInfo(StockCode = "cod.27.347d",
                  AssessmentYear = 2017,
                  ContactPerson = "itsme@fisheries.com")
fishdata <- stockFishdata(Year = 1990:2017, Catches = 100)
xmlfile <- createSAGxml(info, fishdata)

out <- readSAGxml(xmlfile)




