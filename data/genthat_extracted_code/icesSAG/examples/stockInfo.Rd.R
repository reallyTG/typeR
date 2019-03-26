library(icesSAG)


### Name: stockInfo
### Title: Create a list of fish stock information
### Aliases: stockInfo

### ** Examples

info <-
  stockInfo(StockCode = "cod.27.47d20",
            AssessmentYear = 2017,
            StockCategory = 1,
            ModelType = "A",
            ModelName = "SCA",
            ContactPerson = "itsme@fisheries.com")

 info
 info$mistake <- "oops"
 info
 # should have gotten a warning message

 ## Not run: 
##D  # use icesVocab to list valid codes etc.
##D  library(icesVocab)
##D  # print the list of valid stock codes
##D  stock.codes <- getCodeList("ICES_StockCode")
##D  stock.codes[1:10,1:2]
##D 
##D  # print the list of assessment model types in the ICES vocabulary
##D  model.types <- getCodeList("AssessmentModelType")
##D  model.types[1:2]
##D 
##D  # print the list of assessment model names in the ICES vocabulary
##D  model.names <- getCodeList("AssessmentModelName")
##D  model.names$Key
##D  
## End(Not run)



