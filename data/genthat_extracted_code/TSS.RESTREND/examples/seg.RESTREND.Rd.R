library(TSS.RESTREND)


### Name: seg.RESTREND
### Title: Segmented RESTREND (RESidual TREND)
### Aliases: seg.RESTREND

### ** Examples

# brkp can be determined using VPR.BFAST and CHOW.
brkp <-  as.integer(11)
resu <- seg.RESTREND(segRESTREND$max.NDVI, segRESTREND$acc.precip, segRESTREND$index, brkp)



