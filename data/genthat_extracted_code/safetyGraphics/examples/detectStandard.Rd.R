library(safetyGraphics)


### Name: detectStandard
### Title: Detect the data standard used for a data set
### Aliases: detectStandard

### ** Examples

detectStandard(adlbc)[["standard"]] #AdAM
detectStandard(iris)[["standard"]] #none

## Not run: 
##D   detectStandard(adlbc,domain="AE") #throws error. AE domain not supported in this release. 
## End(Not run)




