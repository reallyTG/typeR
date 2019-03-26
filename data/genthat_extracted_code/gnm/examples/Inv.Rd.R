library(gnm)


### Name: Inv
### Title: Specify the Reciprocal of a Predictor in a gnm Model Formula
### Aliases: Inv
### Keywords: models regression nonlinear

### ** Examples

## One way to fit the logistic function without conditional
## linearity as in ?nls
library(gnm)
set.seed(1)
DNase1 <- subset(DNase, Run == 1)

test <- gnm(density ~ -1 +
            Mult(1, Inv(Const(1) + Exp(Mult(1 + offset(-log(conc)),
                                                Inv(1))))),
            start = c(NA, 0, 1), data = DNase1, trace = TRUE)
coef(test)



