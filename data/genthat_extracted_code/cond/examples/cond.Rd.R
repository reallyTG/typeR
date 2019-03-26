library(cond)


### Name: cond
### Title: Approximate Conditional Inference - Generic Function
### Aliases: cond
### Keywords: models regression methods

### ** Examples

## Urine Data 
data(urine)
urine.glm <- glm(r ~ gravity + ph + osmo + conduct + urea + log(calc), 
                 family = binomial, data = urine)
##
## function call as offset variable 
labels(coef(urine.glm))
cond(urine.glm, log(calc))
##
## large estimate of regression coefficient
urine.glm <- glm(r ~ gravity + ph + osmo + conduct + urea + calc, 
                 family = binomial, data = urine)
coef(urine.glm)
urine.glm <- glm(r ~ I(gravity * 100) + ph + osmo + conduct + urea + calc, 
                 family = binomial, data = urine)
coef(urine.glm)
urine.cond <- cond(urine.glm, I(gravity * 100))
plot(urine.cond, which = 4)

## House Price Data
## Not run: 
##D data(houses)
##D houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
##D ##
##D ## parameter of interest: scale parameter
##D houses.marg <- cond(houses.rsm, scale)
##D plot(houses.marg, which = 2)
## End(Not run)



