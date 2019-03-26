library(OpenMx)


### Name: mxBootstrapStdizeRAMpaths
### Title: Bootstrap distribution of standardized RAM path coefficients
### Aliases: mxBootstrapStdizeRAMpaths

### ** Examples

require(OpenMx)
data(myFADataRaw)
myFADataRaw <- myFADataRaw[,c("x1","x2","x3","x4","x5","x6")]
dataRaw      <- mxData( observed=myFADataRaw, type="raw" )
resVars      <- mxPath( from=c("x1","x2","x3","x4","x5","x6"), arrows=2,
                        free=TRUE, values=c(1,1,1,1,1,1),
                        labels=c("e1","e2","e3","e4","e5","e6") ) 
latVar       <- mxPath( from="F1", arrows=2,
                        free=TRUE, values=1, labels ="varF1" )
facLoads     <- mxPath( from="F1", to=c("x1","x2","x3","x4","x5","x6"), arrows=1,
                        free=c(FALSE,TRUE,TRUE,TRUE,TRUE,TRUE), values=c(1,1,1,1,1,1),
                        labels =c("l1","l2","l3","l4","l5","l6") )
means        <- mxPath( from="one", to=c("x1","x2","x3","x4","x5","x6","F1"), arrows=1,
                        free=c(TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE), 
                        values=c(1,1,1,1,1,1,0),
                        labels =c("meanx1","meanx2","meanx3",
                                  "meanx4","meanx5","meanx6",NA) ) 
oneFactorModel <- mxModel("Common Factor Model Path Specification", type="RAM",
                        manifestVars=c("x1","x2","x3","x4","x5","x6"), latentVars="F1",
                        dataRaw, resVars, latVar, facLoads, means)
oneFactorFit <- mxRun(oneFactorModel)    
set.seed(170505)

## Not run: 
##D oneFactorBoot <- mxBootstrap(oneFactorFit)
##D mxBootstrapStdizeRAMpaths(oneFactorBoot)
## End(Not run)



