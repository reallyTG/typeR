library(QCA)


### Name: negate
### Title: Negate Boolean expressions
### Aliases: negate deMorgan
### Keywords: functions

### ** Examples


# example from Ragin (1987, p.99)
negate("AC + B~C")

# with different intersection operators
negate("AB*EF + ~CD*EF")


# using an object of class "qca" produced with minimize()
data(LC)
cLC <- minimize(LC, outcome = "SURV")

negate(cLC)


# parsimonious solution
pLC <- minimize(LC, outcome = "SURV", include = "?")

negate(pLC)




