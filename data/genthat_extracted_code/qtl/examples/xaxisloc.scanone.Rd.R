library(qtl)


### Name: xaxisloc.scanone
### Title: Get x-axis locations in scanone plot
### Aliases: xaxisloc.scanone
### Keywords: hplot

### ** Examples

data(hyper)
## Don't show: 
hyper <- subset(hyper, c(1,4,6,15))
## End(Don't show)
hyper <- calc.genoprob(hyper)
out <- scanone(hyper, method="hk")
plot(out, chr=c(1, 4, 6, 15))

# add arrow and text to indicate peak LOD score
mxout <- max(out)
x <- xaxisloc.scanone(out, mxout$chr, mxout$pos, chr=c(1,4,6,15))
arrows(x+30, mxout$lod, x+5, mxout$lod, len=0.1, col="blue")
text(x+35, mxout$lod, "the peak", col="blue", adj=c(0, 0.5))



