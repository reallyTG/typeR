library(QCApro)


### Name: factorize
### Title: Factorize Configurational Expressions
### Aliases: factorize
### Keywords: functions

### ** Examples

# factorize a disjunction of two two-way conjunctions;
# if single letters are used, argument "and.split" is not needed
factorize("AB + AC")

# "and.split" is needed in these cases
factorize("one*TWO*four + one*THREE + THREE*four", and.split = "*")
factorize("~ONE*TWO*~FOUR + ~ONE*THREE + THREE*~FOUR", and.split = "*")
factorize("one&TWO&four + one&THREE + THREE&four", and.split = "&")

# factorize solution objects directly
data(d.represent)
KRO.sol <- eQMC(d.represent, outcome = "WNP")
factorize(KRO.sol)



