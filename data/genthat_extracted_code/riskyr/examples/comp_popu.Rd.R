library(riskyr)


### Name: comp_popu
### Title: Compute a population table from frequencies.
### Aliases: comp_popu

### ** Examples

comp_popu(hi = 4, mi = 1, fa = 2, cr = 3)  # => computes a table of N = 10 cases

popu <- comp_popu()  # => initializes popu (with current values of freq and txt)
dim(popu)            # => N x 3
head(popu)           # => shows head of data frame





