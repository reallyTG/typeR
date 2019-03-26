library(gamboostLSS)


### Name: india
### Title: Malnutrition of Children in India (DHS, 1998-99)
### Aliases: india india.bnd
### Keywords: datasets

### ** Examples

if (require("BayesX")) {
  ## plot distribution of stunting in India
  drawmap(india, map = india.bnd, regionvar = "mcdist", plotvar = "stunting")
}



