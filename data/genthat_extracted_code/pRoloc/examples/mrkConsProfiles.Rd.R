library(pRoloc)


### Name: mrkConsProfiles
### Title: Marker consensus profiles
### Aliases: mrkConsProfiles

### ** Examples

library("pRolocdata")
data(dunkley2006)
mrkConsProfiles(dunkley2006)
mrkConsProfiles(dunkley2006, method = median)
mm <- mrkConsProfiles(dunkley2006)
## Reorder fractions
o <- order(dunkley2006$fraction)
## Plot mean organelle profiles using the
## default pRoloc colour palette.
matplot(t(mm[, o]), type = "l",
        xlab = "Fractions", ylab = "Relative intensity",
        main = "Mean organelle profiles",
        col = getStockcol(), lwd = 2, lty = 1)
## Add a legend
addLegend(markerMSnSet(dunkley2006), where = "topleft")



