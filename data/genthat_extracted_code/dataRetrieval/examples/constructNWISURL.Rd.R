library(dataRetrieval)


### Name: constructNWISURL
### Title: Construct NWIS url for data retrieval
### Aliases: constructNWISURL
### Keywords: USGS data import service web

### ** Examples

site_id <- '01594440'
startDate <- '1985-01-01'
endDate <- ''
pCode <- c("00060","00010")
url_daily <- constructNWISURL(site_id,pCode,
           startDate,endDate,'dv',statCd=c("00003","00001"))
url_unit <- constructNWISURL(site_id,pCode,"2012-06-28","2012-06-30",'iv')

url_qw_single <- constructNWISURL(site_id,"01075",startDate,endDate,'qw')
url_qw <- constructNWISURL(site_id,c('01075','00029','00453'),
           startDate,endDate,'qw')
url_daily_tsv <- constructNWISURL(site_id,pCode,startDate,endDate,'dv',
           statCd=c("00003","00001"),format="tsv")
url_rating <- constructNWISURL(site_id,service="rating",ratingType="base")
url_peak <- constructNWISURL(site_id, service="peak")
url_meas <- constructNWISURL(site_id, service="meas")
urlQW <- constructNWISURL("450456092225801","70300",startDate="",endDate="","qw",expanded=TRUE)



