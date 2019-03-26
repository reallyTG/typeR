library(BigVAR)


### Name: cv.BigVAR
### Title: Cross Validation for BigVAR
### Aliases: cv.BigVAR cv.BigVAR,BigVAR-method

### ** Examples

data(Y)
# Fit a Basic VARX-L with rolling cross validation 
Model1=constructModel(Y,p=4,struct="Basic",gran=c(50,10))
results=cv.BigVAR(Model1)



