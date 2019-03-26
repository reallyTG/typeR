library(archdata)


### Name: Nelson
### Title: Prehistoric Ceramics at Pueblo San Cristobal, New Mexico, USA
### Aliases: Nelson
### Keywords: datasets

### ** Examples

data(Nelson)
# Remove Depth and Corrugated and compute percentages
Nelson.pct <- prop.table(as.matrix(Nelson[,3:7]), 1)*100
# Percentages for each type by level
round(Nelson.pct, 2)
# Battleship plot from plotrix package
library(plotrix)
battleship.plot(Nelson.pct)



