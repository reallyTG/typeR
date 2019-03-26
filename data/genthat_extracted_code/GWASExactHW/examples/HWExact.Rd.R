library(GWASExactHW)


### Name: HWExact
### Title: Function to calculate Hardy-Weinburg exact p-values
### Aliases: HWExact
### Keywords: htest

### ** Examples


pA<- runif(1)
pAA<- pA^2
pAa<- 2*pA*(1-pA)
paa<- (1-pA)^2

counts<- rmultinom(1000, 3000, c(pAA, pAa, paa) )
genotypes<- data.frame(nAA = counts[1,], nAa = counts[2,], naa = counts[3,])
hwPvalues<- HWExact(genotypes)




