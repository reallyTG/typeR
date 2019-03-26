library(ordinal)


### Name: nominal_test
### Title: Likelihood ratio tests of model terms in scale and nominal
###   formulae
### Aliases: nominal_test scale_test nominal_test.clm scale_test.clm
### Keywords: models

### ** Examples


## Fit cumulative link model:
fm <- clm(rating ~ temp + contact, data=wine)
summary(fm)
## test partial proportional odds assumption for temp and contact:
nominal_test(fm)
## no evidence of non-proportional odds.
## test if there are signs of scale effects:
scale_test(fm)
## no evidence of scale effects.

## tests of scale and nominal effects for the housing data from MASS:
if(require(MASS)) {
    fm1 <- clm(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
    scale_test(fm1)
    nominal_test(fm1)
    ## Evidence of multiplicative/scale effect of 'Cont'. This is a breach
    ## of the proportional odds assumption.
}




