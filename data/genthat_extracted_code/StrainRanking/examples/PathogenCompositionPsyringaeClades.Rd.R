library(StrainRanking)


### Name: PathogenCompositionPsyringaeClades
### Title: Compositions of Pseudomonas syringae at the clade resolution
### Aliases: Clades PathogenCompositionPsyringaeClades PsyringaeClades
### Keywords: datasets

### ** Examples

## Load Pathogen Compositions of P. syringae at the clade resolution
data(PathogenCompositionPsyringaeClades)

## Size of the first sample
sum(PathogenCompositionPsyringaeClades[1,])

## Size of the second sample
sum(PathogenCompositionPsyringaeClades[2,])

## Total number of different variants
ncol(PathogenCompositionPsyringaeClades)

## Display pathogen compositions
x=PathogenCompositionPsyringaeClades
barplot(t(x), col=rainbow(ncol(x)), main="P. syringae - Clades")



