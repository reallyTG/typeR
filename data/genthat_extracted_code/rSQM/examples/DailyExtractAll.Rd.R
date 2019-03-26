library(rSQM)


### Name: DailyExtractAll
### Title: Extract daily time series
### Aliases: DailyExtractAll

### ** Examples

## Not run: 
##D rSQMSampleProject() 
##D ## Step 1. Set working environment
##D EnvList <- SetWorkingEnvironment(envfile = "rSQM.yaml")
##D ## Step 2. Load climate scenario data
##D LoadCmip5DataFromAdss(dbdir = EnvList$dbdir, NtlCode = EnvList$NtlCode)
##D ## Step 3. Extract daily time series
##D DailyExtractAll(
##D cmip5dir = EnvList$cmip5dir,
##D stndir = EnvList$stndir,
##D stnfile = EnvList$stnfile,
##D qmapdir = EnvList$qmapdir,
##D SimAll = EnvList$SimAll,
##D ModelNames = EnvList$ModelNames,
##D RcpNames = EnvList$RcpNames,
##D VarNames = EnvList$VarNames,
##D OWrite = EnvList$OWrite)
## End(Not run)



