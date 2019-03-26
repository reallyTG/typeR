library(cNORM)


### Name: cnorm.cv
### Title: Cross validation for term selection
### Aliases: cnorm.cv

### ** Examples

# plot cross validation RMSE by number of terms up to 9 with three repetitions
data <- prepareData()
cnorm.cv(data, 3, max=7, norms=FALSE)



