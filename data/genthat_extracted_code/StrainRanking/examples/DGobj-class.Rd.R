library(StrainRanking)


### Name: DGobj-class
### Title: Class '"DGobj"'
### Aliases: DGobj-class 'DG class' DGobj DG 'DG object' [,DGobj-method
###   [<-,DGobj-method names,DGobj-method show,DGobj-method
###   summary,DGobj-method
### Keywords: classes

### ** Examples

showClass("DGobj")

## load powderymildew data
data(powderymildew)

## construct a DG object from raw data
DGdata=DGobj.rawdata(demographic.coord=powderymildew$demographic.coord,
 genetic.coord=powderymildew$genetic.coord,
 demographic.measures=powderymildew$demographic.measures,
 genetic.frequencies=powderymildew$genetic.frequencies)

## show
DGdata
## summary
summary(DGdata)
## show the demographic slot
DGdata["demographic"]
## show the genetic slot
DGdata["genetic"]
## modify the demographic slot
#DGdata["demographic"]=DGdata["demographic"][1:50,]
## names of slots
names(DGdata)



