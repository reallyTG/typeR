library(VSE)


### Name: makeMRVS
### Title: makeMRVS
### Aliases: makeMRVS
### Keywords: VSE

### ** Examples

## Not run: 
##D ld <- loadLd("ld.csv", type="raggr")
##D avs <- makeAVS(ld)
##D makeMRVS(avs, bgSize=100, mc.cores=8)
## End(Not run)
#As an example, we have added MRVS (size=200) for Breast Cancer AVS.
load(file.path(system.file("extdata", "bca.mrvs.200.Rda", package="VSE")))



