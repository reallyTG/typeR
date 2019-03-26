library(StrainRanking)


### Name: PathogenCompositionMoryzaeChina
### Title: Compositions of Magnaporthe oryzae collected in China
### Aliases: China MoryzaeChina PathogenCompositionMoryzaeChina
### Keywords: datasets

### ** Examples

## Load Pathogen Compositions of M. oryzae collected in China
data(PathogenCompositionMoryzaeChina)

## Size of the first sample
sum(PathogenCompositionMoryzaeChina[1,])

## Size of the second sample
sum(PathogenCompositionMoryzaeChina[2,])

## Total number of different variants
ncol(PathogenCompositionMoryzaeChina)

## Display pathogen compositions
x=PathogenCompositionMoryzaeChina
barplot(t(x), col=rainbow(ncol(x)), main="M. oryzae - China")



