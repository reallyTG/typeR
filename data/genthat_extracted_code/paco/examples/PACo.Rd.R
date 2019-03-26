library(paco)


### Name: PACo
### Title: Performs PACo analysis.
### Aliases: PACo

### ** Examples

data(gopherlice)
require(ape)
gdist <- cophenetic(gophertree)
ldist <- cophenetic(licetree)
D <- prepare_paco_data(gdist, ldist, gl_links)
D <- add_pcoord(D)
D <- PACo(D, nperm=10, seed=42, method="r0")
print(D$gof)



