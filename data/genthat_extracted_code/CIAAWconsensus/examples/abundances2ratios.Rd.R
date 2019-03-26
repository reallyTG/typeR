library(CIAAWconsensus)


### Name: abundances2ratios
### Title: Isotope ratios of a chemical element from isotopic abundances
### Aliases: abundances2ratios

### ** Examples

## Isotope ratios of zinc from the isotopic abundances
x = c(0.48630, 0.27900, 0.04100, 0.18750, 0.00620)
ux = c(0.00091, 0.00076, 0.00031, 0.00135, 0.00010)
abundances2ratios(x,ux,ref=2)

## The corresponding atomic weight can be obtained using at.weight(z$R,z$R.cov,"zinc","66Zn")



