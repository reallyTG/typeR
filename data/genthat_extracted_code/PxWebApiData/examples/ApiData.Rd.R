library(PxWebApiData)


### Encoding: UTF-8

### Name: ApiData
### Title: PX-Web Data by API
### Aliases: ApiData

### ** Examples

## Not run: 
##D ##### Readymade dataset by GET - works only for Statistics Norway readymade datasets
##D x <- ApiData("http://data.ssb.no/api/v0/dataset/1066.json?lang=en", getDataByGET = TRUE)
##D x[[1]]  # The label version of the data set
##D x[[2]]  # The id version of the data set
##D 
##D ##### Special output
##D ApiData("http://data.ssb.no/api/v0/en/table/09941", returnMetaData = TRUE)   # meta data
##D ApiData("http://data.ssb.no/api/v0/en/table/09941", returnMetaValues = TRUE) # meta data values
##D ApiData("http://data.ssb.no/api/v0/en/table/09941", returnMetaFrames = TRUE) # list of data frames
##D ApiData("http://data.ssb.no/api/v0/en/table/09941", returnApiQuery = TRUE)   # query using defaults
##D 
##D 
##D ##### Ordinary use
##D 
##D # NACE2007 as imaginary value (top 10), ContentsCode as TRUE (all), Tid is default
##D ApiData("http://data.ssb.no/api/v0/en/table/09941", NACE2007 = 10i, ContentsCode = TRUE)
##D 
##D # Two specified and the last is default (as above) – in Norwegian change en to no in url
##D ApiData("http://data.ssb.no/api/v0/no/table/09941", NACE2007 = 10i, ContentsCode = TRUE)
##D 
##D # Number of residents (bosatte) last year, each region
##D ApiData("http://data.ssb.no/api/v0/en/table/04861", Region = TRUE, 
##D         ContentsCode = "Bosatte", Tid = 1i)
##D 
##D # Number of residents (bosatte) each year, total
##D ApiData("http://data.ssb.no/api/v0/en/table/04861", Region = FALSE, 
##D         ContentsCode = "Bosatte", Tid = TRUE)
##D 
##D # Some years
##D ApiData("http://data.ssb.no/api/v0/en/table/04861", Region = FALSE, 
##D         ContentsCode = "Bosatte", Tid = c(1, 5, -1))
##D 
##D # Two selected regions
##D ApiData("http://data.ssb.no/api/v0/en/table/04861", Region = c("0811", "0301"), 
##D         ContentsCode = 1, Tid = c(1, -1))
##D 
##D 
##D ##### Using id instead of url, unnamed input and verbosePrint
##D ApiData(4861, c("0811", "0301"), 1, c(1, -1)) # same as below 
##D ApiData(4861, Region = c("0811", "0301"), ContentsCode=1, Tid=c(1, -1)) 
##D names(ApiData(4861,returnMetaFrames = TRUE))  # these names from metadata assumed two lines above
##D ApiData("4861", c("0811", "0301"), 1, c(1, -1),  urlType="SSBen")
##D ApiData("01222", c("0811", "0301"), c(4, 9:11), 2i, verbosePrint = TRUE)
##D ApiData(1066, getDataByGET = TRUE,  urlType="SSB")
##D ApiData(1066, getDataByGET = TRUE,  urlType="SSBen")
##D 
##D 
##D ##### Advanced use using list. See details above. Try returnApiQuery=TRUE on the same examples. 
##D ApiData(4861, Region = list("03*"), ContentsCode = 1, Tid = 5i) # "all" can be dropped from the list
##D ApiData(4861, Region = list("all", "03*"), ContentsCode = 1, Tid = 5i)  # same as above
##D ApiData(04861, Region = list("item", c("0811", "0301")), ContentsCode = 1, Tid = 5i)
##D 
##D 
##D ##### Using data from SCB to illustrate returnMetaFrames
##D urlSCB <- "http://api.scb.se/OV0104/v1/doris/sv/ssd/BE/BE0101/BE0101A/BefolkningNy"
##D mf <- ApiData(urlSCB, returnMetaFrames = TRUE)
##D names(mf)              # All the variable names
##D attr(mf, "text")       # Corresponding text information as attribute
##D mf$ContentsCode        # Data frame for the fifth variable (alternatively  mf[[5]])
##D attr(mf,"elimination") # Finding variables that can be eliminated
##D ApiData(urlSCB,        # Eliminating all variables that can be eliminated (line below)
##D         Region = FALSE, Civilstand = FALSE, Alder = FALSE,  Kon = FALSE,
##D         ContentsCode  = "BE0101N1", # Selecting a single ContentsCode by text input
##D         Tid = TRUE)                 # Choosing all possible values of Tid.
##D  
##D                
##D ##### Using data from Statfi to illustrate us of input by variable labels (valueTexts)
##D urlStatfi <- "http://pxnet2.stat.fi/PXWeb/api/v1/en/StatFin/vrm/kuol/statfin_kuol_pxt_010.px"
##D ApiData(urlStatfi, returnMetaFrames = TRUE)$Tiedot
##D ApiData(urlStatfi, Alue = FALSE, Vuosi = TRUE, Tiedot = "Population")  # same as Tiedot = '15' 
## End(Not run)



