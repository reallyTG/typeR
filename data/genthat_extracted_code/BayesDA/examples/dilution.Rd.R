library(BayesDA)


### Name: dilution
### Title: Serial Dilution Assay
### Aliases: dilution
### Keywords: datasets

### ** Examples

data(dilution)
str(dilution)
unknowns <- dilution$unknowns
standards <- dilution$standards
dil.unknowns <- dilution$dil.unknowns
dil.standards <- dilution$dil.standards
plot(dil.standards, standards)
matplot(dil.unknowns, unknowns, type="b")



