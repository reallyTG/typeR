library(pca3d)


### Name: metabo
### Title: Metabolic profiles in tuberculosis.
### Aliases: metabo
### Keywords: datasets

### ** Examples

data(metabo)
 # maybe str(metabo) ; plot(metabo) ...
 pca <- prcomp( metabo[,-1] )



