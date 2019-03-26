library(parsec)


### Name: proFreq
### Title: Observed profile frequencies
### Aliases: proFreq

### ** Examples

vl <- c(2, 3, 2)
prf <- var2prof(varlen = vl)
pop <- matrix(c(2, 1, 1, 1, 2, 1, 2, 3, 1), 3, 3)
rownames(pop) <- LETTERS[1:3]

proFreq(profiles = prf, population = pop)



