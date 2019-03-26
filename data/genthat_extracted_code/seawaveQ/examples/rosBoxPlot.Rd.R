library(seawaveQ)


### Name: rosBoxPlot
### Title: Boxplot of water-quality data
### Aliases: rosBoxPlot
### Keywords: hplot

### ** Examples

data(swData)
# summary of water-quality concentrations
apply(IllRivValleyCty[, grep("P[[:digit:]]",
      dimnames(IllRivValleyCty)[[2]])], 2, summary)
# simple boxplot of water-quality concentrations
rosBoxPlot(IllRivValleyCty)
# same boxplot function with many additional plotting arguments
rosBoxPlot(IllRivValleyCty,
           site="05586100 Illinois River at Valley City, IL",
           log="y", yaxt="n", ylim=c(0.0000001, 1), qwcols=c("R", "P"),
           ylab=c("Concentration, micrograms per liter"),
           col="skyblue1", cex.axis=0.7, cex.sub=0.8,
           par(tcl=0.5, las=1, yaxs="i", mgp=c(3, 0.5, 0),
               mar=c(5, 5, 2, 2),cex.main=0.9))
axis(2,
     at=c(0.0000001, 0.000001, 0.00001, 0.0001, 0.001, 0.01, 0.1, 1),
     labels=c("0.0000001", "0.000001","0.00001", "0.0001", "0.001",
              "0.01", "0.1", "1"), cex.axis=0.7)



