library(archdata)


### Name: BarmoseI.pp
### Title: Piece plotted artifacts from Barmose I, South Zealand, Denmark
### Aliases: BarmoseI.pp

### ** Examples

data(BarmoseI.pp)
plot(North~East, BarmoseI.pp, asp=1, pch=as.numeric(Class))
legend("bottomleft", levels(BarmoseI.pp$Label), pch=1:11, cex=.75)



