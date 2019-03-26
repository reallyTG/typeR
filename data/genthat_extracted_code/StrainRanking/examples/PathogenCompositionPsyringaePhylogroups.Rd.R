library(StrainRanking)


### Name: PathogenCompositionPsyringaePhylogroups
### Title: Compositions of Pseudomonas syringae at the phylogroup
###   resolution
### Aliases: PathogenCompositionPsyringaePhylogroups Phylogroups
###   PsyringaePhylogroups
### Keywords: datasets

### ** Examples

## Load Pathogen Compositions of P. syringae at the phylogroup resolution
data(PathogenCompositionPsyringaePhylogroups)

## Size of the first sample
sum(PathogenCompositionPsyringaePhylogroups[1,])

## Size of the second sample
sum(PathogenCompositionPsyringaePhylogroups[2,])

## Total number of different variants
ncol(PathogenCompositionPsyringaePhylogroups)

## Display pathogen compositions
x=PathogenCompositionPsyringaePhylogroups
barplot(t(x), col=rainbow(ncol(x)), main="P. syringae - Phylogroups")



