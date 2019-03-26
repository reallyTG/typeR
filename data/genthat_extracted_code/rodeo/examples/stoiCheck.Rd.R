library(rodeo)


### Name: stoiCheck
### Title: Validation of a Stoichiometry Matrix
### Aliases: stoiCheck

### ** Examples

# Eq. 1 and 2 are from Soetaert et al. (1996), Geochimica et Cosmochimica
# Acta, 60 (6), 1019-1040. 'OM' is organic matter. Constants 'nc' and 'pc'
# represent the nitrogen/carbon and phosphorus/carbon ratio, respectively.
reactions <- c(
  oxicDegrad= "OM + O2 -> CO2 + nc * NH3 + pc * H3PO4 + H2O",
  denitrific= "OM + 0.8*HNO3 -> CO2 + nc*NH3 + 0.4*N2 + pc*H3PO4 + 1.4*H2O",
  dissPhosp1= "H3PO4 <-> H + H2PO4",
  dissPhosp2= "H2PO4 <-> H + HPO4"
)
# Non-evaluated stoichiometry matrix
stoi <- stoiCreate(reactions, toRight="_f", toLeft="_b")
# Parameters ('nc' and 'pc' according to Redfield ratio)
pars <- list(nc=16/106, pc=1/106)
# Elemental composition
comp <- rbind(
  OM=    c(C=1, N="nc", P="pc", H="2 + 3*nc + 3*pc"),
  O2=    c(C=0, N=0,    P=0,    H=0),
  CO2=   c(C=1, N=0,    P=0,    H=0),
  NH3=   c(C=0, N=1,    P=0,    H=3),
  H3PO4= c(C=0, N=0,    P=1,    H=3),
  H2PO4= c(C=0, N=0,    P=1,    H=2),
  HPO4=  c(C=0, N=0,    P=1,    H=1),
  H2O=   c(C=0, N=0,    P=0,    H=2),
  HNO3=  c(C=0, N=1,    P=0,    H=1),
  N2=    c(C=0, N=2,    P=0,    H=0),
  H=     c(C=0, N=0,    P=0,    H=1)
)
# We need the transposed form
comp <- t(comp)
# Mass balance check
bal <- stoiCheck(stoi, comp=comp, env=pars)
print(bal)
print(colSums(bal) == 0)



