library(Rssa)


### Name: precache
### Title: Calculates and caches elementary components inside SSA object
### Aliases: precache precache.ssa

### ** Examples

# Decompose 'co2' series with default parameters
s <- ssa(co2)
summary(s)
# Precache the stuff
precache(s)
summary(s)



