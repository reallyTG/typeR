library(StrainRanking)


### Name: PathogenCompositionPtriticinaKalango
### Title: Compositions of Puccinia triticina in Kalango crops
### Aliases: Kalango PathogenCompositionPtriticinaKalango PtriticinaKalango
### Keywords: datasets

### ** Examples

## Load Pathogen Compositions of P. triticina in Kalango crops
data(PathogenCompositionPtriticinaKalango)

## Size of the first sample
sum(PathogenCompositionPtriticinaKalango[1,])

## Total number of different variants
ncol(PathogenCompositionPtriticinaKalango)

## Display pathogen compositions
x=PathogenCompositionPtriticinaKalango
barplot(t(x), col=rainbow(ncol(x)), las=2, main="P. triticina - Kalango")



