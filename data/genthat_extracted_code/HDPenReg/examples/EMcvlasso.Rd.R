library(HDPenReg)


### Name: EMcvlasso
### Title: cross validation for 'EMlasso'
### Aliases: EMcvlasso

### ** Examples

dataset <- simul(50, 100, 0.4, 1, 10, matrix(c(0.1,0.8,0.02,0.02),nrow=2))
result <- EMcvlasso(X = dataset$data, y = dataset$response,
                    lambda = 5:1, nbFolds = 5,intercept = FALSE)



