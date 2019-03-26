library(mice)


### Name: mice.impute.cart
### Title: Imputation by classification and regression trees
### Aliases: mice.impute.cart cart
### Keywords: datagen

### ** Examples

require(rpart)

imp <- mice(nhanes2, meth = 'cart', minbucket = 4)
plot(imp)




