library(genasis)


### Name: genpastoact
### Title: Recalculates adsorption results from passive air samplers to
###   (active-like) concentrations
### Aliases: genpastoact
### Keywords: genpastoact

### ** Examples

## Vector input
genpastoact(c(1,2,1.2,1.1,0.1),days=28,pollutant=c("pp-DDE"))

## Use of example data from the package:
data(kosetice.pas.genasis)
genpastoact(kosetice.pas.genasis,input="genasis",
            method="gaps7",pollutant=c("PCB 28"))
data(kosetice.pas.openair)
genpastoact(genoutlier(kosetice.pas.openair[,c(1:4,20)],plot=FALSE)$res,
            method="auto")



