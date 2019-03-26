library(semTools)


### Name: indProd
### Title: Make products of indicators using no centering, mean centering,
###   double-mean centering, or residual centering
### Aliases: indProd orthogonalize

### ** Examples


## Mean centering / two-way interaction / match-paired
dat <- indProd(attitude[ , -1], var1 = 1:3, var2 = 4:6)

## Residual centering / two-way interaction / match-paired
dat2 <- indProd(attitude[ , -1], var1 = 1:3, var2 = 4:6, match = FALSE,
                meanC = FALSE, residualC = TRUE, doubleMC = FALSE)

## Double-mean centering / two-way interaction / match-paired
dat3 <- indProd(attitude[ , -1], var1 = 1:3, var2 = 4:6, match = FALSE,
                meanC = TRUE, residualC = FALSE, doubleMC = TRUE)

## Mean centering / three-way interaction / match-paired
dat4 <- indProd(attitude[ , -1], var1 = 1:2, var2 = 3:4, var3 = 5:6)

## Residual centering / three-way interaction / match-paired
dat5 <- orthogonalize(attitude[ , -1], var1 = 1:2, var2 = 3:4, var3 = 5:6,
                      match = FALSE)

## Double-mean centering / three-way interaction / match-paired
dat6 <- indProd(attitude[ , -1], var1 = 1:2, var2 = 3:4, var3 = 5:6,
                match = FALSE, meanC = TRUE, residualC = TRUE,
                doubleMC = TRUE)




