library(mosaic)


### Name: orrr
### Title: Odds Ratio and Relative Risk for 2 x 2 Contingency Tables
### Aliases: orrr oddsRatio relrisk print.oddsRatio print.relrisk
###   summary.oddsRatio summary.relrisk
### Keywords: stats

### ** Examples

M1 <- matrix(c(14, 38, 51, 11), nrow = 2)
M1
oddsRatio(M1)

M2 <- matrix(c(18515, 18496, 1427, 1438), nrow = 2)
rownames(M2) <- c("Placebo", "Aspirin")
colnames(M2) <- c("No", "Yes")
M2
oddsRatio(M2)
oddsRatio(M2, verbose = TRUE)
relrisk(M2, verbose = TRUE)
if (require(mosaicData)) {
relrisk(tally(~ homeless + sex, data = HELPrct) )
do(3) * relrisk( tally( ~ homeless + shuffle(sex), data = HELPrct) )
}



