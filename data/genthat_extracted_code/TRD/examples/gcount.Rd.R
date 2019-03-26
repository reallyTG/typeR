library(TRD)


### Name: gcount
### Title: Calculate genotype counts (additive model) for selected
###   population.
### Aliases: gcount

### ** Examples

trios=rtrios(100000,500,0.1,0.2,0.3,1,0.5,0.5,0.1)
gcount(trios$case)
gcount(trios$ctrl)
gcount(rbind(trios$case,trios$ctrl))



