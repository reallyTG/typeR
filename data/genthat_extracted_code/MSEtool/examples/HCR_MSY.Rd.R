library(MSEtool)


### Name: HCR_MSY
### Title: Harvest control rule to fish at some fraction of maximum
###   sustainable yield
### Aliases: HCR_MSY

### ** Examples

# create an MP to run in closed-loop MSE (fishes at UMSY)
DD_MSY <- make_MP(DD_TMB, HCR_MSY)
class(DD_MSY)

# The same MP which fishes at 75% of UMSY
DD_75MSY <- make_MP(DD_TMB, HCR_MSY, MSY_frac = 0.75)
class(DD_MSY)

## Not run: 
##D myOM <- DLMtool::runMSE(DLMtool::testOM, MPs = c("FMSYref", "DD_MSY"))
## End(Not run)



