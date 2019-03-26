library(oce)


### Name: handleFlags,argo-method
### Title: Handle Flags in ARGO Objects
### Aliases: handleFlags,argo-method

### ** Examples

library(oce)
data(argo)
# 1. Default: set to NA any data that is not flagged with
# code value 1 (meaning \code{"passed_all_tests"})
argoNew <- handleFlags(argo, flags=c(0, 2:9))
# Demonstrate replacement, looking at the second profile
f <- argo[["salinityFlag"]][,2] # first column with a flag=4 entry
df <- data.frame(flag=f, orig=argo[["salinity"]][,2], new=argoNew[["salinity"]][,2])
df[11:15,] # notice line 13

# 2. A less restrictive case: focussing just on salinity,
# retain only data with flags 1 (meaning \code{"passed_all_tests"})
# and 2 (\code{"probably_good"}).
argoNew <- handleFlags(argo, flags=list(salinity=c(0, 3:9)))




