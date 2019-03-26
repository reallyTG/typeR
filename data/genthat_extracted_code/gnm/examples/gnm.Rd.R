library(gnm)


### Name: gnm
### Title: Fitting Generalized Nonlinear Models
### Aliases: gnm
### Keywords: models regression nonlinear

### ** Examples

###  Analysis of a 4-way contingency table
set.seed(1)
print(cautres)

##  Fit a "double UNIDIFF" model with the religion-vote and class-vote
##  interactions both modulated by nonnegative election-specific
##  multipliers.
doubleUnidiff <- gnm(Freq ~ election:vote + election:class:religion
                     + Mult(Exp(election), religion:vote) +
                     Mult(Exp(election), class:vote), family = poisson,
                     data = cautres)

##  Examine the multipliers of the class-vote log odds ratios
ofInterest(doubleUnidiff) <- pickCoef(doubleUnidiff, "class:vote[).]")
coef(doubleUnidiff)
## Coefficients of interest:
## Mult(Exp(.), class:vote).election1 
##                        -0.38357138 
## Mult(Exp(.), class:vote).election2 
##                         0.29816599 
## Mult(Exp(.), class:vote).election3 
##                         0.06580307 
## Mult(Exp(.), class:vote).election4 
##                        -0.02174104

##  Re-parameterize by setting first multiplier to zero
getContrasts(doubleUnidiff, ofInterest(doubleUnidiff))
##                                     estimate        SE
## Mult(Exp(.), class:vote).election1 0.0000000 0.0000000
## Mult(Exp(.), class:vote).election2 0.6817374 0.2401644
## Mult(Exp(.), class:vote).election3 0.4493745 0.2473521
## Mult(Exp(.), class:vote).election4 0.3618301 0.2534754
##                                       quasiSE    quasiVar
## Mult(Exp(.), class:vote).election1 0.22854401 0.052232363
## Mult(Exp(.), class:vote).election2 0.07395886 0.005469913
## Mult(Exp(.), class:vote).election3 0.09475938 0.008979340
## Mult(Exp(.), class:vote).election4 0.10934798 0.011956981

##  Same thing but with last multiplier as reference category:
getContrasts(doubleUnidiff, rev(ofInterest(doubleUnidiff)))
##                                       estimate        SE
## Mult(Exp(.), class:vote).election4  0.00000000 0.0000000
## Mult(Exp(.), class:vote).election3  0.08754436 0.1446833
## Mult(Exp(.), class:vote).election2  0.31990727 0.1320022
## Mult(Exp(.), class:vote).election1 -0.36183013 0.2534754
##                                       quasiSE    quasiVar
## Mult(Exp(.), class:vote).election4 0.10934798 0.011956981
## Mult(Exp(.), class:vote).election3 0.09475938 0.008979340
## Mult(Exp(.), class:vote).election2 0.07395886 0.005469913
## Mult(Exp(.), class:vote).election1 0.22854401 0.052232363

##  Re-fit model with first multiplier set to zero
doubleUnidiffConstrained <-
    update(doubleUnidiff, constrain = ofInterest(doubleUnidiff)[1])

##  Examine the multipliers of the class-vote log odds ratios
coef(doubleUnidiffConstrained)[ofInterest(doubleUnidiff)]
##  ...as using 'getContrasts' (to 4 d.p.).



