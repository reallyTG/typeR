library(eaf)


### Name: SPEA2minstoptimeRichmond
### Title: Results of SPEA2 when minimising electrical cost and maximising
###   the minimum idle time of pumps on Richmond water network.
### Aliases: SPEA2minstoptimeRichmond
### Keywords: datasets

### ** Examples

data(HybridGA)
data(SPEA2minstoptimeRichmond)
SPEA2minstoptimeRichmond[,2] <- SPEA2minstoptimeRichmond[,2] / 60
eafplot (SPEA2minstoptimeRichmond, xlab = expression(C[E]),
        ylab = "Minimum idle time (minutes)",
        las = 1, log = "y", maximise = c(FALSE, TRUE))




