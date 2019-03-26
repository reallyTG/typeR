library(seqRFLP)


### Name: frag.dat
### Title: Reports for simulated RFLP cutting pattern
### Aliases: frag.dat
### Keywords: fragment RFLP

### ** Examples


### fragdat() example
data(enzdata)
data(fil.phy)
fas <- ConvFas(fil = fil.phy, type = "phy")
frag.dat(fil = fas, enznames = "EcoRI", enzdata = enzdata)




