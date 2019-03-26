library(imputeR)


### Name: mixGuess
### Title: Naive imputation for mixed type data
### Aliases: mixGuess

### ** Examples

data(tic)
missdata <- SimIm(tic, 0.1)
sum(is.na(missdata))
impdata <- mixGuess(missdata)
sum(is.na(impdata))



