library(polyRAD)


### Name: AddPCA
### Title: Perform Principal Components Analysis on "RADdata" Object
### Aliases: AddPCA AddPCA.RADdata
### Keywords: methods

### ** Examples

# load data
data(exampleRAD)
# do PCA
exampleRAD <- AddPCA(exampleRAD, nPcsInit = 3)

plot(exampleRAD$PCA[,1], exampleRAD$PCA[,2])



