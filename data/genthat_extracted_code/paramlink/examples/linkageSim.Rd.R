library(paramlink)


### Name: linkageSim
### Title: Simulate markers linked to a disease locus.
### Aliases: linkageSim

### ** Examples


x = linkdat(toyped, model=1)
y = linkageSim(x, N=10, afreq=c(0.5, 0.5))
stopifnot(length(mendelianCheck(y))==0)

z = addOffspring(cousinPed(1), father=7, mother=8, noffs=1, aff=2)
z = setModel(z, 2)
linkageSim(z, N=1, afreq = c(0.1, 0.2, 0.7))




