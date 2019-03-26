library(eaf)


### Name: SPEA2relativeVanzyl
### Title: Results of SPEA2 with relative time-controlled triggers on
###   Vanzyl's water network.
### Aliases: SPEA2relativeVanzyl
### Keywords: datasets

### ** Examples

data(HybridGA)
data(SPEA2relativeVanzyl)
eafplot(SPEA2relativeVanzyl, percentiles = c(25, 50, 75), 
       xlab = expression(C[E]), ylab = "Total switches", xlim = c(320, 400),
       extra.points = HybridGA$vanzyl, extra.legend = "Hybrid GA")




