library(isqg)


### Name: founder
### Title: Constructor of a Founder Instances of the Specimen Class
### Aliases: founder

### ** Examples

data(ToyMap)
spc <- set_specie(ToyMap)

## through standalone function
AA <- founder(spc, "AA")
aa <- founder(spc, "aa")

## or by the Specie's method
Aa <- spc$founder("Aa")
aA <- spc$founder("aA")




