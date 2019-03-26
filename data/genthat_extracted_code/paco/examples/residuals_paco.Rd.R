library(paco)


### Name: residuals_paco
### Title: Return Procrustes residuals from a paco object
### Aliases: residuals_paco

### ** Examples

data(gopherlice)
library(ape)
gdist <- cophenetic(gophertree)
ldist <- cophenetic(licetree)
D <- prepare_paco_data(gdist, ldist, gl_links)
D <- add_pcoord(D, correction='cailliez')
D <- PACo(D, nperm=100, seed=42, method='r0')
residuals_paco(D$proc)



