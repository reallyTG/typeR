library(pRoloc)


### Name: plotConsProfiles
### Title: Plot marker consenses profiles.
### Aliases: plotConsProfiles

### ** Examples

library("pRolocdata")
data(E14TG2aS1)
hc <- mrkHClust(E14TG2aS1, plot = FALSE)
mm <- getMarkerClasses(E14TG2aS1)
ord <- levels(factor(mm))[order.dendrogram(hc)]
fmat <- mrkConsProfiles(E14TG2aS1)
plotConsProfiles(fmat, order = ord)



