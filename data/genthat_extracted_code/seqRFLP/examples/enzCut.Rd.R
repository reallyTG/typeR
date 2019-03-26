library(seqRFLP)


### Name: enzCut
### Title: Restriction enzyme cutting pattern
### Aliases: enzCut
### Keywords: RFLP TRFLP

### ** Examples


## enzCut() example
data(enzdata)
enznames <- c("EcoRI", "Acc65I")
data(fil.phy)
fas <- ConvFas(fil = fil.phy, type = "phy")
enzCut(DNAsq = fas[2], enznames = "AluI", enzdata = enzdata)




