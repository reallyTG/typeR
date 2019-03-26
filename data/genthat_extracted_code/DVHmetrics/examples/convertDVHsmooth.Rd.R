library(DVHmetrics)


### Name: convertDVHsmooth
### Title: Convert between differential and cumulative DVH
### Aliases: convertDVHsmooth convertDVHsmooth.matrix convertDVHsmooth.DVHs
###   convertDVHsmooth.DVHLst convertDVHsmooth.DVHLstLst

### ** Examples

res <- convertDVHsmooth(dataMZ[[c(1, 1)]],
                  toType="cumulative",
                  toDoseUnit="CGY")



