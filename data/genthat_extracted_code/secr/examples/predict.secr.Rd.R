library(secr)


### Name: predict.secr
### Title: SECR Model Predictions
### Aliases: predict.secr predict.secrlist detectpar detectpar.secr
### Keywords: models

### ** Examples


## load previously fitted secr model with trap response
## and extract estimates of `real' parameters for both
## naive (b = 0) and previously captured (b = 1) animals

predict (secrdemo.b, newdata = data.frame(b = 0:1))

## OR from secr 3.1.4 
predict (secrdemo.b, all.levels = TRUE)

temp <- predict (secrdemo.b, all.levels = TRUE, save = TRUE)
attr(temp, "newdata")

detectpar(secrdemo.0)



