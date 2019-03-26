library(isqg)


### Name: import
### Title: Constructor of a Custom Instances of the Specimen Class
### Aliases: import

### ** Examples

data(ToyMap)
spc <- set_specie(ToyMap)

## simulating what is very close to your real genotypes
Real <- sample(c('2 2', '2 1', '1 2', '1 1'), size = nrow(ToyMap), replace = TRUE)
names(Real) <- ToyMap$snp # ensure snp names!

## now you can play _in silico_
Virtual <- import(spc, Real)
S1 <- Virtual$selfcross(n = 10)




