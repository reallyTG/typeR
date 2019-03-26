library(strataG)


### Name: popGenEqns
### Title: Population Genetics Equations
### Aliases: popGenEqns wrightFst numGensEq fstToNm expectedNumAlleles

### ** Examples

dispersal <- seq(0.05, 0.8, by = 0.05)
fst <- wrightFst(100, dispersal, 20, 2)
plot(dispersal, fst, type = "l")

numGensEq(0.15, 100, 20)
numGensEq(0.3, 100, 20)
numGensEq(0.15, 50, 20)

fst <- seq(0.001, 0.2, length.out = 100)
Nm <- fstToNm(fst, 2)
plot(fst, Nm, type = "l")

expectedNumAlleles(20, 1, 2)
# double the samples
expectedNumAlleles(40, 1, 2)
# for a haploid locus
expectedNumAlleles(40, 1, 1)
# double theta
expectedNumAlleles(40, 2, 1)




