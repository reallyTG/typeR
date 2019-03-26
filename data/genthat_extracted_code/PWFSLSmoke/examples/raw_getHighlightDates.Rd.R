library(PWFSLSmoke)


### Name: raw_getHighlightDates
### Title: Return Day Stamps for Values Above a Threshold
### Aliases: raw_getHighlightDates

### ** Examples

## Not run: 
##D raw <- airsis_createRawDataframe(startdate = 20160901, provider = 'USFS',unitID = '1033')
##D raw <- raw_enhance(raw)
##D highlightRange <- c(50,Inf)
##D dataVar <- 'pm25'
##D tzone <- "America/Los_Angeles"
##D highlightDates <- raw_getHighlightDates(raw,dataVar,tzone,highlightRange)
##D rawPlot_timeOfDaySpaghetti(df=raw,highlightDates = highlightDates)
## End(Not run)



