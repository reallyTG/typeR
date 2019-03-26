library(SWMPr)


### Name: qaqc
### Title: QAQC filtering for SWMP data
### Aliases: qaqc qaqc.swmpr

### ** Examples

## Not run: 
##D ## get data
##D data(apadbwq)
##D dat <- apadbwq
##D 
##D ## retain only '0' and '-1' flags
##D qaqc(dat, qaqc_keep = c('0', '-1'))
##D 
##D ## retain observations with the 'CSM' error code
##D qaqc(dat, qaqc_keep = 'CSM')
## End(Not run)



