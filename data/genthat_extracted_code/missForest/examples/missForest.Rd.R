library(missForest)


### Name: missForest
### Title: Nonparametric Missing Value Imputation using Random Forest
### Aliases: missForest
### Keywords: nonparametric classes NA

### ** Examples

## Nonparametric missing value imputation on mixed-type data:
data(iris)
summary(iris)

## The data contains four continuous and one categorical variable.

## Artificially produce missing values using the 'prodNA' function:
set.seed(81)
iris.mis <- prodNA(iris, noNA = 0.2)
summary(iris.mis)

## Impute missing values providing the complete matrix for
## illustration. Use 'verbose' to see what happens between iterations:
iris.imp <- missForest(iris.mis, xtrue = iris, verbose = TRUE)

## The imputation is finished after five iterations having a final
## true NRMSE of 0.143 and a PFC of 0.036. The estimated final NRMSE
## is 0.157 and the PFC is 0.025 (see Details for the reason taking
## iteration 4 instead of iteration 5 as final value).

## The final results can be accessed directly. The estimated error:
iris.imp$OOBerror

## The true imputation error (if available):
iris.imp$error

## And of course the imputed data matrix (do not run this):
## iris.imp$Ximp



