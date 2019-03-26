library(cplm)


### Name: zcpglm
### Title: Zero-inflated Compound Poisson Generalized Linear Models
### Aliases: zcpglm
### Keywords: models

### ** Examples

da <- subset(AutoClaim, IN_YY == 1) # use data in the Yip and Yau paper
da <- transform(da, CLM_AMT5 = CLM_AMT5/1000,
                 INCOME = INCOME/10000)
(Z0 <- zcpglm(CLM_AMT5 ~ CAR_USE + MARRIED + AREA + MVR_PTS||
             MVR_PTS + INCOME, data = da))




