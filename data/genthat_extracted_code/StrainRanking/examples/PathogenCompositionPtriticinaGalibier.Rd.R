library(StrainRanking)


### Name: PathogenCompositionPtriticinaGalibier
### Title: Compositions of Puccinia triticina in Galibier crops
### Aliases: Galibier PathogenCompositionPtriticinaGalibier
###   PtriticinaGalibier
### Keywords: datasets

### ** Examples

## Load Pathogen Compositions of P. triticina in Galibier crops
data(PathogenCompositionPtriticinaGalibier)

## Size of the first sample
sum(PathogenCompositionPtriticinaGalibier[1,])

## Total number of different variants
ncol(PathogenCompositionPtriticinaGalibier)

## Display pathogen compositions
x=PathogenCompositionPtriticinaGalibier
barplot(t(x), col=rainbow(ncol(x)), las=2, main="P. triticina - Galibier")



