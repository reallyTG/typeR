library(sprex)


### Name: expected.num.species
### Title: Expected Number of Species
### Aliases: expected.num.species

### ** Examples

data(osa.old.growth)
f <- expand.freqs(osa.old.growth)
expected.num.species(60, f = f, f0.func = Chao1)

expected.num.species(c(60, 70, 75), f = f, f0.func = Chao1)



