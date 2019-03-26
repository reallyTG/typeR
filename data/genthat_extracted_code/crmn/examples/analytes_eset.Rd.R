library(crmn)


### Name: analytes_eset
### Title: Accessor for the analytes
### Aliases: analytes,ExpressionSet,missing-method analytes_eset

### ** Examples

data(mix)
analytes(mix)
fData(mix)$test <- fData(mix)$tag
analytes(mix, where="test")



