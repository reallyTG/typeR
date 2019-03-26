library(hoa)


### Name: cond.glm
### Title: Approximate Conditional Inference for Logistic and Loglinear
###   Models
### Aliases: cond.glm
### Keywords: regression models methods

### ** Examples

## Crying Babies Data
data(babies)
babies.glm <- glm(formula = cbind(r1, r2) ~ day + lull - 1, 
                  family = binomial, data = babies)
babies.cond <- cond(object = babies.glm, offset = lullyes)
babies.cond

## Urine Data 
## (function call as offset variable) 
data(urine)
urine.glm <- glm(r ~ gravity + ph + osmo + conduct + urea + log(calc), 
                 family = binomial, data = urine)
labels(coef(urine.glm))
urine.cond <- cond(urine.glm, log(calc))
##
## (large estimate of regression coefficient)
urine.glm <- glm(r ~ gravity + ph + osmo + conduct + urea + calc, 
                 family = binomial, data = urine)
coef(urine.glm)
urine.glm <- glm(r ~ I(gravity * 100) + ph + osmo + conduct + urea + calc, 
                 family = binomial, data = urine)
coef(urine.glm)
urine.cond <- cond(urine.glm, I(gravity * 100))

## Fungal Infections Treatment Data (numerical instabilities around the
##                                   MLE)
## (full data analysis)
data(fungal)
fungal.glm <- glm(cbind(success, failure) ~ center + group - 1, 
                  family = binomial, data = fungal, 
                  control = glm.control(maxit = 50, epsilon = 1e-005))
fungal.cond <- cond(fungal.glm, groupT)
plot(fungal.cond, which = 2)
## (partial data analysis)
fungal.glm <- glm(cbind(success, failure) ~ center + group - 1, 
                  family = binomial, data = fungal, subset = -c(1,2,5,6), 
                  control = glm.control(maxit = 50, epsilon = 1e-005))
fungal.cond <- cond(fungal.glm, groupT)
plot(fungal.cond, which = 2)
## (Tables 1 and 3 are omitted).



