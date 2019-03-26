library(pRolocdata)


### Name: hyperLOPIT2015
### Title: Protein and PMS-level hyperLOPIT datasets on Mouse E14TG2a
###   embryonic stem cells from Christoforou et al. (2016).
### Aliases: hyperLOPIT2015 hyperLOPIT2015ms3r1 hyperLOPIT2015ms3r2
###   hyperLOPIT2015ms3r3 hyperLOPIT2015ms2 hyperLOPIT2015goCC
###   hyperLOPIT2015ms2psm hyperLOPIT2015ms3r1psm hyperLOPIT2015ms3r2psm
### Keywords: datasets

### ** Examples

data(hyperLOPIT2015)
hyperLOPIT2015
pData(hyperLOPIT2015)
head(exprs(hyperLOPIT2015))

data(hyperLOPIT2015ms3r1psm)
x <- combineFeatures(hyperLOPIT2015ms3r1psm,
		     groupBy = fData(hyperLOPIT2015ms3r1psm)$Protein.Group.Accession,
		     fun = median)
library("pRoloc")
par(mfrow = c(1, 2))
plot2D(hyperLOPIT2015ms3r1psm, main = "PSM-level")
plot2D(x, main = "Protein-level (using mean)")



