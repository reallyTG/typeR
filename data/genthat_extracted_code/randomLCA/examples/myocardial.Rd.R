library(randomLCA)


### Name: myocardial
### Title: Myocardial Infarction (MI)
### Aliases: myocardial
### Keywords: datasets

### ** Examples

# fit 2 class model from Rindskopf and Rindskopf (1986)
myocardial.lca2 <- randomLCA(myocardial[,1:4],freq=myocardial$freq)



