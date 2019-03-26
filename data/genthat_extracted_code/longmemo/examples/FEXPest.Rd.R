library(longmemo)


### Name: FEXPest
### Title: Fractional EXP (FEXP) Model Estimator
### Aliases: FEXPest print.FEXP
### Keywords: ts

### ** Examples

data(videoVBR)
(fE  <- FEXPest(videoVBR, order = 3, pvalmax = .5))
(fE3 <- FEXPest(videoVBR, order = 3, pvalmax = 1 ))

(fE7 <- FEXPest(videoVBR, order = 3, pvalmax = 0.10))
##--> this also choses order 2, as "FE" :
all.equal(fE $coef,
          fE7$coef) # -> TRUE

confint(fE)
confint(fE7, level = 0.99)



