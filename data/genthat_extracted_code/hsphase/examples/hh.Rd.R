library(hsphase)


### Name: hh
### Title: Heatmap of Half-sibs
### Aliases: hh
### Keywords: heatmap pedigree

### ** Examples

c1h1 <- .simulateHalfsib(numInd = 62, numSNP = 5000)
c1h2 <- .simulateHalfsib(numInd = 38, numSNP = 5000)
Genotype <- rbind(c1h1, c1h2)
oh <- ohg(Genotype) # creating the Opposing Homozygote matrix
hh(oh)



