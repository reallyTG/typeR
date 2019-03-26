library(hoa)


### Name: urine
### Title: Urine Data
### Aliases: urine
### Keywords: datasets

### ** Examples

data(urine)
summary(urine)
pairs(urine)
##
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



