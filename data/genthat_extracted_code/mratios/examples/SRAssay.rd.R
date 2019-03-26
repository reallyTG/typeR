library(mratios)


### Name: SRAssay
### Title: Slope ratio assay of panthotenic acid contents in plant tissues
### Aliases: SRAssay
### Keywords: datasets

### ** Examples


library(mratios)

data(SRAssay)

str(SRAssay)

plot(Response~Dose, data=SRAssay)

# library(lattice)
# xyplot(Response~Dose|Treatment, data=SRAssay)

# see ?sci.ratio.gen for  the analysis of this dataset




