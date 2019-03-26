library(robCompositions)


### Name: biplot.pcaCoDa
### Title: Biplot method
### Aliases: biplot.pcaCoDa
### Keywords: aplot

### ** Examples


data(coffee)
p1 <- pcaCoDa(coffee[,-1])
p1
biplot(p1)


## with labels for the scores:
data(arcticLake)
rownames(arcticLake) <- paste(sample(letters[1:26], nrow(arcticLake), replace=TRUE), 
                              1:nrow(arcticLake), sep="")
pc <- pcaCoDa(arcticLake, method="classical")
biplot(pc, xlabs=rownames(arcticLake))





