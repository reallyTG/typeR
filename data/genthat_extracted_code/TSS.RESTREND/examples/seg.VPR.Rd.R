library(TSS.RESTREND)


### Name: seg.VPR
### Title: Segmented Vegetation Climate Relationship
### Aliases: seg.VPR

### ** Examples

brkp <- as.integer(24) #calculated using th CHOW (DONTRUN) example
VPRres <- seg.VPR(segVPR$max.NDVI, segVPR$acum.RF, segVPR$index, brkp, segVPR$RFB4, segVPR$RFAF)
print(VPRres)



