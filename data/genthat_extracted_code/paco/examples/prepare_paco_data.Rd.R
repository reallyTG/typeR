library(paco)


### Name: prepare_paco_data
### Title: Prepares the data (distance matrices and association matrix) for
###   PACo analysis
### Aliases: prepare_paco_data

### ** Examples

data(gopherlice)
library(ape)
gdist <- cophenetic(gophertree)
ldist <- cophenetic(licetree)
D <- prepare_paco_data(gdist, ldist, gl_links)



