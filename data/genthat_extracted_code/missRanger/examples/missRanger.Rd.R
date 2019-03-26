library(missRanger)


### Name: missRanger
### Title: Fast Imputation of Missing Values by Chained Tree Ensembles
### Aliases: missRanger

### ** Examples

irisWithNA <- generateNA(iris)
irisImputed <- missRanger(irisWithNA, pmm.k = 3, num.trees = 100)
head(irisImputed)
head(irisWithNA)

# With extra trees algorithm
irisImputed_et <- missRanger(irisWithNA, pmm.k = 3, num.trees = 100, splitrule = "extratrees")
head(irisImputed_et)



