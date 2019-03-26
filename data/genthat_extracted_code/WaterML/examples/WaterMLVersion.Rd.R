library(WaterML)


### Name: WaterMLVersion
### Title: WaterMLVersion
### Aliases: WaterMLVersion
### Keywords: WaterML

### ** Examples

library(httr)
library(XML)
url <- "http://www.waterml2.org/KiWIS-WML2-Example.wml"
response <- GET(url)
doc <- xmlParse(response)
version <- WaterMLVersion(doc)



