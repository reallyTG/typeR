library(MSnbase)


### Name: imageNA2
### Title: NA heatmap visualisation for 2 groups
### Aliases: imageNA2

### ** Examples

library("pRolocdata")
library("pRoloc")
data(dunkley2006)
pcol <- ifelse(dunkley2006$fraction <= 5, "A", "B")
nax <- makeNaData(dunkley2006, pNA = 0.10)
exprs(nax)[sample(nrow(nax), 30), pcol == "A"] <- NA
exprs(nax)[sample(nrow(nax), 50), pcol == "B"] <- NA
MSnbase:::imageNA2(nax, pcol)
MSnbase:::imageNA2(nax, pcol, useGroupMean = TRUE)
MSnbase:::imageNA2(nax, pcol, Colv = FALSE, useGroupMean = FALSE)
MSnbase:::imageNA2(nax, pcol, Colv = FALSE, useGroupMean = TRUE)



