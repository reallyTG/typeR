library(rSQM)


### Name: DailyQMapAll
### Title: Quantile mapping bias-correction
### Aliases: DailyQMapAll

### ** Examples

## Not run: 
##D ## Step 0. Load sample project
##D rSQMSampleProject() 
##D 
##D ## Step 1. Set working environment
##D EnvList <- SetWorkingEnvironment(envfile = "rSQM.yaml")
##D 
##D ## Step 2. Load climate scenario data
##D LoadCmip5DataFromAdss(dbdir = EnvList$dbdir, NtlCode = EnvList$NtlCode)
##D 
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
##D 
##D ## Step 4. Bias-correction by simple quantile mapping
##D DailyQMapAll(
##D   stndir = EnvList$stndir,
##D   stnfile = EnvList$stnfile,
##D   qmapdir = EnvList$qmapdir,
##D   prjdir = EnvList$prjdir,
##D   SimAll = EnvList$SimAll,
##D   RcpNames = EnvList$RcpNames,
##D   VarNames = EnvList$VarNames,
##D   syear_obs = EnvList$syear_obs,
##D   eyear_obs = EnvList$eyear_obs,
##D   syear_his = EnvList$syear_his,
##D   eyear_his = EnvList$eyear_his,
##D   syear_scn = EnvList$syear_scn,
##D   eyear_scn = EnvList$eyear_scn,
##D   OWrite = EnvList$OWrite,
##D   SRadiation = EnvList$SRadiation) 
## End(Not run)



