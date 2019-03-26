library(dataRetrieval)


### Name: importRDB1
### Title: Function to return data from the NWIS RDB 1.0 format
### Aliases: importRDB1

### ** Examples

site_id <- "02177000"
startDate <- "2012-09-01"
endDate <- "2012-10-01"
offering <- "00003"
property <- "00060"

obs_url <- constructNWISURL(site_id,property,
         startDate,endDate,"dv",format="tsv")
## Not run: 
##D data <- importRDB1(obs_url)
##D 
##D urlMultiPcodes <- constructNWISURL("04085427",c("00060","00010"),
##D          startDate,endDate,"dv",statCd=c("00003","00001"),"tsv")
##D multiData <- importRDB1(urlMultiPcodes)
##D unitDataURL <- constructNWISURL(site_id,property,
##D          "2013-11-03","2013-11-03","uv",format="tsv") #includes timezone switch
##D unitData <- importRDB1(unitDataURL, asDateTime=TRUE)
##D qwURL <- constructNWISURL(c('04024430','04024000'),
##D           c('34247','30234','32104','34220'),
##D          "2010-11-03","","qw",format="rdb") 
##D qwData <- importRDB1(qwURL, asDateTime=TRUE, tz="America/Chicago")
##D iceSite <- '04024000'
##D start <- "2015-11-09"
##D end <- "2015-11-24"
##D urlIce <- constructNWISURL(iceSite,"00060",start, end,"uv",format="tsv")
##D ice <- importRDB1(urlIce, asDateTime=TRUE)
##D iceNoConvert <- importRDB1(urlIce, convertType=FALSE)
## End(Not run)
# User file:
filePath <- system.file("extdata", package="dataRetrieval")
fileName <- "RDB1Example.txt"
fullPath <- file.path(filePath, fileName)
importUserRDB <- importRDB1(fullPath)




