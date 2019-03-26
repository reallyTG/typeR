library(EGRET)


### Name: fluxBiasMulti
### Title: Produces 8-panel plot that is useful for determining if there is
###   a flux bias problem
### Aliases: fluxBiasMulti
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
fluxBiasMulti(eList)
# Water year:
## Not run: 
##D pdf("fluxBiasMulti.pdf", height=9, width=8)
##D fluxBiasMulti(eList)
##D dev.off()
##D # Graphs consisting of Jun-Aug
##D eList <- setPA(eList,paStart=6,paLong=3)
##D pdf("fluxBiasMultiSummer.pdf", height=9, width=8)
##D fluxBiasMulti(eList)
##D dev.off()
## End(Not run)



