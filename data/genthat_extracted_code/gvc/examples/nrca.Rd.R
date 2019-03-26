library(gvc)


### Name: nrca
### Title: New Revealed Comparative Advantage
### Aliases: nrca

### ** Examples

# load the decompr package
library(decompr)
           
# load the example data set
data(leather)

# perform Leontief decomposition
l <- decomp(inter,
            final,
            countries,
            industries,
            out,
            method = "leontief",
            post = "exports"    )

# load gvc package
library(gvc)

# perform New Revealed Comparative Advantage
nrca(l)




