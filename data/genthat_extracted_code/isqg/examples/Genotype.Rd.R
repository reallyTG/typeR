library(isqg)


### Name: genotype
### Title: Codify Specimens' Genotypes
### Aliases: genotype

### ** Examples

data(ToyMap)
spc <- set_specie(ToyMap)

Aa <- founder(spc, "Aa")
aA <- spc$founder("aA")

Both <- list(Aa = Aa, aA = aA)

## different ways
genotype(Both)               # as numeric   
genotype(Both, phase = TRUE) # as character




