library(marelac)


### Name: molweight
### Title: Molecular Weight of a Chemical Species
### Aliases: molweight
### Keywords: utilities

### ** Examples

molweight("CO2")
molweight("HCO3")
molweight("H")
molweight("H3PO4")

## eicosapentaenoic acid (EPA)
molweight("CH3CH2CHCHCH2CHCHCH2CHCHCH2CHCHCH2CHCH(CH2)3COOH")
molweight("C20H30O2")

## works also with vectors
molweight(c("C2H5OH", "CO2", "H2O"))
molweight(c("SiOH4", "NaHCO3", "C6H12O6", "Ca(HCO3)2", "Pb(NO3)2", "(NH4)2SO4"))

## note that chemical formulae are case-sensitive
molweight("Co") # cobalt
molweight("CO") # carbon monoxide


## from gram to mol
1/molweight("CO3")




