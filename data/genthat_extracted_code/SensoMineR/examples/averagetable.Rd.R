library(SensoMineR)


### Name: averagetable
### Title: Computes a (products,descriptors) matrix
### Aliases: averagetable
### Keywords: models

### ** Examples

data(chocolates)
resaverage<-averagetable(sensochoc, formul = "~Product+Panelist",
    firstvar = 5)
coltable(magicsort(resaverage), level.upper = 6,level.lower = 4,
    main.title = "Average by chocolate")

res.pca = PCA(resaverage, scale.unit = TRUE)



