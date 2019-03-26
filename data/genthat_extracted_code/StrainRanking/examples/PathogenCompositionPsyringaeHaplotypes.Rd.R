library(StrainRanking)


### Name: PathogenCompositionPsyringaeHaplotypes
### Title: Compositions of Pseudomonas syringae at the haplotype resolution
### Aliases: Haplotypes PathogenCompositionPsyringaeHaplotypes
###   PsyringaeHaplotypes
### Keywords: datasets

### ** Examples

## Load Pathogen Compositions of P. syringae at the haplotype resolution
data(PathogenCompositionPsyringaeHaplotypes)

## Size of the first sample
sum(PathogenCompositionPsyringaeHaplotypes[1,])

## Size of the second sample
sum(PathogenCompositionPsyringaeHaplotypes[2,])

## Total number of different variants
ncol(PathogenCompositionPsyringaeHaplotypes)

## Display pathogen compositions
x=PathogenCompositionPsyringaeHaplotypes
barplot(t(x), col=rainbow(ncol(x)), main="P. syringae - Haplotypes")



