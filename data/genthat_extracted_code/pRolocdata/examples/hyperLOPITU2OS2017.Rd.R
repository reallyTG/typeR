library(pRolocdata)


### Name: hyperLOPITU2OS2017
### Title: 2017 and 2018 hyperLOPIT on U2OS cells
### Aliases: hyperLOPITU2OS2017 hyperLOPITU2OS2017b hyperLOPITU2OS2018
###   lopitdcU2OS2018 U2OS
### Keywords: datasets

### ** Examples

data(hyperLOPITU2OS2017)
hyperLOPITU2OS2017

library("pRoloc")
plot2D(hyperLOPITU2OS2017, addLegend = "bottomleft")

## removing low intensity fractions
sort(colSums(exprs(hyperLOPITU2OS2017)))
i <- order(colSums(exprs(hyperLOPITU2OS2017)))[1:3]
x <- hyperLOPITU2OS2017[, -i]
plot2D(x, mirrorY = TRUE)

data(hyperLOPITU2OS2017b)
## only difference if subsetting date
all.equal(hyperLOPITU2OS2017b, x)
processingData(hyperLOPITU2OS2017b)
processingData(x)



