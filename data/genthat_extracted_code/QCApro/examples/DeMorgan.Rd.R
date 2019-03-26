library(QCApro)


### Name: DeMorgan
### Title: Negate Boolean Expressions using De Morgan's Laws
### Aliases: DeMorgan is.DeMorgan
### Keywords: functions

### ** Examples

# example from Ragin (1987, p.99)
DeMorgan("AC + B~C")

# with different AND-operators
DeMorgan("A*C + B*~C", and.split = "*")
DeMorgan("A&C + B&~C", and.split = "&")

# use solution object of class 'qca' returned by 'eQMC' function, 
# even with multiple models
data(d.represent)
KRO.ps <- eQMC(d.represent, outcome = "WNP")
DeMorgan(KRO.ps)



