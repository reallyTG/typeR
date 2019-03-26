library(RandomFields)


### Name: RMintern
### Title: Internal models
### Aliases: RMintern RMmixed ROmissing RMnull RMSpower RO# RO> RMselect
###   RMSpower RMmult_inverse RMsetparam RMshape.ave RMshape.stp RMr3binner
###   RRarcsqrt RRsetDistr RMptsGivenShape RMstandardShape RMstatShape RPS
###   RPplus RPmult RPmppplus RPtrend
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## in the following 'RPplus' appears as internal model
x <- seq(0, 10, 1) 
z <- RFsimulate(RPspecific(RMexp() + RMnugget()), x)
RFgetModelInfo(which="internal", level=0)

## Don't show: 
FinalizeExample()
## End(Don't show)


