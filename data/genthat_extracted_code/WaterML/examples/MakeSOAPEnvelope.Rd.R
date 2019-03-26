library(WaterML)


### Name: MakeSOAPEnvelope
### Title: MakeSOAPEnvelope
### Aliases: MakeSOAPEnvelope
### Keywords: WaterML

### ** Examples

library(httr)
library(XML)
myEnvelope <- MakeSOAPEnvelope("http://www.cuahsi.org/his/1.1/ws/", "GetSitesObject")
SOAPAction <- "http://www.cuahsi.org/his/1.1/ws/GetSitesObject"
url <- "http://hydrodata.info/chmi-d/cuahsi_1_1.asmx"
response <- POST(url, body = myEnvelope,
                 add_headers("Content-Type" = "text/xml", "SOAPAction" = SOAPAction),
                 verbose())
status.code <- http_status(response)$category
WaterML <- xmlParse(response)
WaterML



