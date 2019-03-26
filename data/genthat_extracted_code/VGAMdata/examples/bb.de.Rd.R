library(VGAMdata)


### Name: bb.de
### Title: Battle of Britain Data (a Luftwaffe subset)
### Aliases: bb.de
### Keywords: datasets

### ** Examples

data(bb.de)
bb.de[,, "Bf109"]

## Not run: 
##D plot(bb.de["sdown",, "Bf109"] ~ as.Date(dimnames(bb.de)[[2]]),
##D      type = "h", col = "blue", las = 1, lwd = 3,
##D      ylab = "Frequency", xlab = "1940",
##D      main = "Numbers shot down (Bf 109)")
##D abline(h = c(5, 10, 15, 20), lty = "dashed", col = "grey")
##D points(bb.de["sdown",,"Bf109"] ~ as.Date(dimnames(bb.de)[[2]]), col = "blue")
## End(Not run)



