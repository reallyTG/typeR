library(phyloclim)


### Name: age.range.correlation
### Title: Age-Range Correlation
### Aliases: age.range.correlation

### ** Examples

# load PNOs for Oxalis sect. Palmatifoliae ...
data(PNO)

# ... and calculate niche overlap between species
no <- niche.overlap(PNO$AnnualMeanTemperature)

# load phylogeny and PNOs of Oxalis sect. Palmatifoliae
data(tree)

# age-range correlation
x <- age.range.correlation(phy = tree, overlap = no, n = 100)

# plot average niche overlap versus node age
plot(x$age.range.correlation)

# add a regression line
abline(x$linear.regression$coefficients)

# add regression lines from Monte Carlo randomization
apply(x$MonteCarlo.replicates, 1, abline, lwd = 0.2, col = "grey50")



