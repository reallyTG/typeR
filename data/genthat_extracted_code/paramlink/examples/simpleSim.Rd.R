library(paramlink)


### Name: simpleSim
### Title: Unconditional marker simulation
### Aliases: simpleSim

### ** Examples


x = nuclearPed(1)
simpleSim(x, N=3, afreq=c(0.5, 0.5))

y = addOffspring(cousinPed(1), father=7, mother=8, noffs=1)
simpleSim(y, N=3, alleles=LETTERS[1:10])




