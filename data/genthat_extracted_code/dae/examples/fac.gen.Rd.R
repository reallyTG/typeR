library(dae)


### Name: fac.gen
### Title: Generate all combinations of several factors
### Aliases: fac.gen
### Keywords: design factor datagen

### ** Examples

## generate a 2^3 factorial experiment with levels - and +, and 
## in Yates order
mp <- c("-", "+")
fnames <- list(Catal = mp, Temp = mp, Press = mp, Conc = mp)
Fac4Proc.Treats <- fac.gen(generate = fnames, order="yates")

## Generate the factors A, B and D. The basic pattern has 4 repetitions
## of the levels of D for each A and B combination and 3 repetitions of 
## the pattern of the B and D combinations for each level of A. This basic 
## pattern has each combination repeated twice, and the whole of this 
## is repeated twice. It generates 864 A, B and D combinations.
gen <- list(A = 3, 3, B = c(0,100,200), 4, D = c("0","1"))
fac.gen(gen, times=2, each=2)



