library(StrainRanking)


### Name: PathogenCompositionMoryzaeMadagascar
### Title: Compositions of Magnaporthe oryzae collected in Madagascar
### Aliases: Madagascar MoryzaeMadagascar
###   PathogenCompositionMoryzaeMadagascar
### Keywords: datasets

### ** Examples

## Load Pathogen Compositions of M. oryzae collected in Madagascar
data(PathogenCompositionMoryzaeMadagascar)

## Size of the first sample
sum(PathogenCompositionMoryzaeMadagascar[1,])

## Size of the second sample
sum(PathogenCompositionMoryzaeMadagascar[2,])

## Total number of different variants
ncol(PathogenCompositionMoryzaeMadagascar)

## Display pathogen compositions
x=PathogenCompositionMoryzaeMadagascar
barplot(t(x), col=rainbow(ncol(x)), main="M. oryzae - Madagascar")



