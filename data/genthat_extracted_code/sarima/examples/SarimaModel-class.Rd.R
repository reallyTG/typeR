library(sarima)


### Name: SarimaModel-class
### Title: Class SarimaModel in package sarima
### Aliases: SarimaModel-class
### Keywords: classes ts sarima

### ** Examples

showClass("SarimaModel")

sm0 <- new("SarimaModel", nseasons = 12)

sm1 <- new("SarimaModel", nseasons = 12, intercept = 3)
## alternatively, pass a model and modify with named arguments
sm1b <- new("SarimaModel", sm0, intercept = 3)
identical(sm1, sm1b) # TRUE

## Note: in the above models var. of innovations is NA

sm2  <- new("SarimaModel", ar = 0.9, nseasons = 12, intercept = 3, sigma2 = 1)
sm2b <- new("SarimaModel", sm1, ar = 0.9, sigma2 = 1)
sm2c <- new("SarimaModel", sm0, ar = 0.9, intercept = 3, sigma2 = 1)
identical(sm2, sm2b) # TRUE
identical(sm2, sm2c) # TRUE

sm3 <- new("SarimaModel", ar = 0.9, sar= 0.8, nseasons = 12, intercept = 3,
           sigma2 = 1)
sm3b <- new("SarimaModel", sm2, sar = 0.8)
identical(sm3, sm3b) # TRUE

new("SarimaModel", ar = 0.9)




