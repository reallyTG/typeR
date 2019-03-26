library(missForest)


### Name: mixError
### Title: Compute Imputation Error for Mixed-type Data
### Aliases: mixError
### Keywords: classes NA

### ** Examples

## Compute imputation error for mixed-type data:
data(iris)

## Artificially produce missing values using the 'prodNA' function:
set.seed(81)
iris.mis <- prodNA(iris, noNA = 0.2)

## Impute missing values using 'missForest':
iris.imp <- missForest(iris.mis)

## Compute the true imputation error manually:
err.imp <- mixError(iris.imp$ximp, iris.mis, iris)
err.imp



