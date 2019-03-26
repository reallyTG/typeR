library(FactoClass)


### Name: FactoClass.tex
### Title: Table of Coordinates, Aids of Interpretation of the Principal
###   Axes and Cluster Analysis in LaTeX format.
### Aliases: FactoClass.tex print.FactoClass.tex latexDF roundDF
### Keywords: multivariate

### ** Examples

data(DogBreeds)
DB.act <- DogBreeds[-7]  # active variables
DB.ilu <- DogBreeds[7]   # illustrative variables
# MCA
FaCl <- FactoClass( DB.act, dudi.acm,
                    scanFC = FALSE, dfilu = DB.ilu, nfcl = 10, k.clust = 4 )
FactoClass.tex(FaCl,job="DogBreeds1", append=TRUE)
# FactoClass.tex(FaCl,job="DogBreeds", append=TRUE , p.clust = TRUE)



