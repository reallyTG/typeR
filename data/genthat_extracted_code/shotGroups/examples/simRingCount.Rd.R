library(shotGroups)


### Name: simRingCount
### Title: Calculate simulated ring count for a given group and target
### Aliases: simRingCount simRingCount.data.frame simRingCount.default

### ** Examples

simRingCount(DFscar17, target='ISSF_100m', caliber=5.56, unit='in')

# ring count for all groups in DFcm data set
rc <- by(DFcm, DFcm$series, FUN=simRingCount, target='BDS9',
         caliber=9, unit='cm')

sapply(rc, function(x) with(x, c(count=count, max=max)))



