library(CHNOSZ)


### Name: util.formula
### Title: Functions to Work with Chemical Formulas
### Aliases: util.formula as.chemical.formula mass entropy GHS ZC i2A

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
## mass and entropy from chemical formulas
mass("H2O")
entropy("H2O")
mass("-1")  # electron
entropy("-1")

## different ways to get the formula of alanine
iA <- info("alanine")
info(iA)$formula
as.chemical.formula(makeup(iA))

## converting among Gibbs energy, enthalpy, entropy
# calculate the value of G from H and S
GHS("H2O", H=water("H"), S=water("S"))[1, ]
# that not quite equal to the value from water("G");
# probably using different entropies of the elements

## average oxidation states of carbon
stopifnot(ZC("CO2") == 4)
stopifnot(ZC("CH4") == -4)
stopifnot(ZC("CHNOSZ") == 7)
si <- info(info("LYSC_CHICK"))
stopifnot(si$formula == "C613H959N193O185S10")
stopifnot(all.equal(ZC(si$formula), 0.0163132137031))

## calculate the chemical formulas, then
## ZC of all of the proteins in CHNOSZ' database
pf <- protein.formula(thermo$protein)
range(mass(pf))
# use na.rm=TRUE because we have a "protein" with a formula of H2O
range(ZC(pf), na.rm=TRUE)



