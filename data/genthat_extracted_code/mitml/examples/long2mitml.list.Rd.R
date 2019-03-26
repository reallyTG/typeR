library(mitml)


### Name: long2mitml.list
### Title: Convert imputations from long format to 'mitml.list'
### Aliases: long2mitml.list jomo2mitml.list

### ** Examples

data(studentratings)
require(jomo)

# impute data using jomo (native functions)
clus <- studentratings[,"ID"]
Y <- studentratings[,c("ReadAchiev","ReadDis")]
imp <- jomo(Y=Y, clus=clus, nburn=1000, nbetween=100, nimp=5)

# split imputations
impList <- long2mitml.list(imp, split="Imputation", exclude=0)
impList <- jomo2mitml.list(imp)



