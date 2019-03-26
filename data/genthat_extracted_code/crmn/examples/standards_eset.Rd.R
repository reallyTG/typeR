library(crmn)


### Name: standards_eset
### Title: Accessor for the Internal Standards
### Aliases: standards,ExpressionSet,missing-method standards_eset

### ** Examples

data(mix)
standards(mix)
fData(mix)$test <- fData(mix)$tag
standards(mix, where="test")



