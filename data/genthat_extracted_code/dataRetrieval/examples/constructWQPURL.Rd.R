library(dataRetrieval)


### Name: constructWQPURL
### Title: Construct WQP url for data retrieval
### Aliases: constructWQPURL
### Keywords: WQP data import service web

### ** Examples

site_id <- '01594440'
startDate <- '1985-01-01'
endDate <- ''
pCode <- c("00060","00010")
url_wqp <- constructWQPURL(paste("USGS",site_id,sep="-"),
           c('01075','00029','00453'),
           startDate,endDate)



