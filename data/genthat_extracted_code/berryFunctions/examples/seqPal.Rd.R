library(berryFunctions)


### Name: seqPal
### Title: Sequential color palette
### Aliases: seqPal
### Keywords: color dplot

### ** Examples


plot(rep(1,12),  pch=16, cex=5, col=seqPal(12), xaxt="n")
showPal()

# nonlinear color scale (use colPoints + see classify for more options):
v <- rescale(volcano^30)
image(v, col=seqPal(1000), asp=1);  colPointsLegend(v, nbins=1000)
image(v, col=seqPal(1000, logbase=1.007), asp=1)
colPointsLegend(v, col=seqPal(1000, logbase=1.007))

plot(    rep(1, 1000), pch=15, cex=3, col=seqPal(1000), ylim=c(0.99, 1.01), ylab="logbase", las=1)
for(b in seq(0.99, 1.01, len=30))
    points(rep(b, 1000), pch=15, cex=1, col=seqPal(1000, logbase=b))




