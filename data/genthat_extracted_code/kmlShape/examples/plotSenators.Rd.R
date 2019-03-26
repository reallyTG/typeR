library(kmlShape)


### Name: plotSenators
### Title: ~ Function: plotSenators ~
### Aliases: plotSenators

### ** Examples

data(ictusShort)
myClds <- cldsWide(ictusShort)
reduceTraj(myClds,nbSenators=4)
plotSenators(myClds)
reduceTraj(myClds,nbSenators=32)
plotSenators(myClds)



