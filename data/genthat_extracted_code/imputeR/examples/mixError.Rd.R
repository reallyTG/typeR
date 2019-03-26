library(imputeR)


### Name: mixError
### Title: Calculate mixed error when the imputed matrix is mixed type
### Aliases: mixError

### ** Examples

data(tic)
Detect(tic)
missdata <- SimIm(tic, 0.3)
## No test: 
library(earth)
impdata <- impute(tic, lmFun = "earth", cFun = "rpartC")
mixError(impdata$imp, missdata, tic)
## End(No test)



