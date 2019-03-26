library(eaf)


### Name: SPEA2relativeRichmond
### Title: Results of SPEA2 with relative time-controlled triggers on
###   Richmond water network.
### Aliases: SPEA2relativeRichmond
### Keywords: datasets

### ** Examples

data(HybridGA)
data(SPEA2relativeRichmond)
eafplot (SPEA2relativeRichmond, percentiles = c(25, 50, 75),
        xlab = expression(C[E]), ylab = "Total switches",
        xlim = c(90, 140), ylim = c(0, 25),
        extra.points = HybridGA$richmond, extra.lty = "dashed",
        extra.legend = "Hybrid GA")




