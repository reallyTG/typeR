library(dataRetrieval)


### Name: readWQPqw
### Title: Raw Data Import for Water Quality Portal
### Aliases: readWQPqw
### Keywords: USGS data import service web

### ** Examples

## Not run: 
##D rawPcode <- readWQPqw('USGS-01594440','01075', '', '')
##D rawCharacteristicName <- readWQPqw('WIDNR_WQX-10032762','Specific conductance', '', '')
##D rawPHsites <- readWQPqw(c('USGS-05406450', 'USGS-05427949','WIDNR_WQX-133040'), 'pH','','')
##D nwisEx <- readWQPqw('USGS-04024000',c('34247','30234','32104','34220'),'','2012-12-20')
##D nwisEx.summary <- readWQPqw('USGS-04024000',c('34247','30234','32104','34220'),
##D     '','2012-12-20', querySummary=TRUE)
## End(Not run)



