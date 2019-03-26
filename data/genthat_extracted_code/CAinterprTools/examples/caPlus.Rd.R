library(CAinterprTools)


### Name: caPlus
### Title: Facility for interpretation-oriented CA scatterplot
### Aliases: caPlus
### Keywords: caPlus

### ** Examples

data(greenacre_data)

#performs CA by means of FactoMineR's CA command, and store the result in the object named resCA.
library(FactoMineR)
resCA <- CA(greenacre_data, graph=FALSE)

#If supplementary data are present, the user has to specify which rows and/or columns 
#are supplmentary into this function (see FactoMineR's documentation).
caPlus(resCA, 1, 2, focus="C", row.suppl=FALSE, col.suppl=FALSE, oneplot=TRUE)




