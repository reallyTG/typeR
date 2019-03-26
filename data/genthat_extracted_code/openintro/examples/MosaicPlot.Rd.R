library(openintro)


### Name: MosaicPlot
### Title: Custom Mosaic Plot
### Aliases: MosaicPlot

### ** Examples

data(email)
data(COL)
email$spam <- ifelse(email$spam == 0, "not\nspam", "spam")
par(las = 1)
MosaicPlot(number ~ spam, email, col = COL[1:3], off = 0.02)



