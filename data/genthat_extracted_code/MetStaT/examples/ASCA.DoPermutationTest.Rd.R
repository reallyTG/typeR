library(MetStaT)


### Name: ASCA.DoPermutationTest
### Title: Permutation test for ASCA
### Aliases: ASCA.DoPermutationTest
### Keywords: ASCA Permutations Significance test

### ** Examples


## Do ASCA on all (both) factors and the interaction between the two factors
data(ASCAdata)
ASCA <- ASCA.Calculate(ASCAX, ASCAF, equation.elements = "1,2,12", scaling = TRUE)

## Do a permutation test to evaluate the significance to the two factors and the interaction.
ASCA.DoPermutationTest(ASCA, perm=1000)



