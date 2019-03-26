library(rodeo)


### Name: stoiCreate
### Title: Stoichiometry Matrix from Reaction Equations
### Aliases: stoiCreate

### ** Examples

# EXAMPLE 1: From https://en.wikipedia.org/wiki/Petersen_matrix (July 2016)
#
reactions <- c(
  formS=  "A + 2 * B -> S",
  equiES= "E + S <-> ES",
  decoES= "ES -> E + P"
)
stoi <- stoiCreate(reactions, eval=TRUE, toRight="_f", toLeft="_b")
print(stoi)

# EXAMPLE 2: Decomposition of organic matter (selected equations only)
#
# Eq. 1 and 2 are from Soetaert et al. (1996), Geochimica et Cosmochimica
# Acta, 60 (6), 1019-1040. 'OM' is organic matter. Constants 'nc' and 'pc'
# represent the nitrogen/carbon and phosphorus/carbon ratio, respectively.
reactions <- c(
  oxicDegrad= "OM + O2 -> CO2 + nc * NH3 + pc * H3PO4 + H2O",
  denitrific= "OM + 0.8*HNO3 -> CO2 + nc*NH3 + 0.4*N2 + pc*H3PO4 + 1.4*H2O",
  dissPhosp1= "H3PO4 <-> H + H2PO4",
  dissPhosp2= "H2PO4 <-> H + HPO4"
)
# Non-evaluated matrix
stoi <- stoiCreate(reactions, toRight="_f", toLeft="_b")
print(stoi)
# Evaluated matrix ('nc' and 'pc' according to Redfield ratio)
pars <- list(nc=16/106, pc=1/106)
stoi <- stoiCreate(reactions, eval=TRUE, env=pars, toRight="_f", toLeft="_b")
print(stoi)



