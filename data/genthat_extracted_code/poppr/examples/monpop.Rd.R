library(poppr)


### Name: monpop
### Title: Peach brown rot pathogen _Monilinia fructicola_
### Aliases: monpop

### ** Examples

data(monpop)
splitStrata(monpop) <- ~Tree/Year/Symptom
setPop(monpop) <- ~Symptom/Year
monpop



