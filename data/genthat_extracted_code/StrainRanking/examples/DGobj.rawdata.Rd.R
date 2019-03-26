library(StrainRanking)


### Name: DGobj.rawdata
### Title: Construction of a DG object from raw data
### Aliases: DGobj.rawdata
### Keywords: datagen

### ** Examples

## load the powdery mildew data set
data(powderymildew)

## create a DG object from this data set
DGdata=DGobj.rawdata(demographic.coord=powderymildew$demographic.coord,
 genetic.coord=powderymildew$genetic.coord,
 demographic.measures=powderymildew$demographic.measures,
 genetic.frequencies=powderymildew$genetic.frequencies)

summary(DGdata)



