library(QCApro)


### Name: randomDGS
### Title: Build a Random Data-Generating Structure
### Aliases: randomDGS

### ** Examples

# randomly generate three data-generating structures on the basis of four
# exogenous factors
str <- randomDGS(n.DGS = 3, exo.facs = LETTERS[1:4], seed.1 = 1375, seed.2 = 3917)
str$DGS

# all correctness-preserving submodels of DGS 2, bd + abC, can then be found with the 
# 'submodels' function
submodels(str$DGS[2])$submodels



