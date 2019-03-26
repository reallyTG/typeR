library(marg)


### Name: cond
### Title: Approximate Conditional Inference - Generic Function
### Aliases: cond
### Keywords: models regression methods

### ** Examples

## Urine Data 
## Not run: 
##D data(urine)
##D urine.glm <- glm(r ~ gravity + ph + osmo + cond + urea + log(calc), 
##D                  family = binomial, data = urine)
##D ##
##D ## function call as offset variable 
##D labels(coef(urine.glm))
##D cond(urine.glm, log(calc))
##D ##
##D ## large estimate of regression coefficient
##D urine.glm <- glm(r ~ gravity + ph + osmo + cond + urea + calc, 
##D                  family = binomial, data = urine)
##D coef(urine.glm)
##D urine.glm <- glm(r ~ I(gravity * 100) + ph + osmo + cond + urea + calc, 
##D                  family = binomial, data = urine)
##D coef(urine.glm)
##D urine.cond <- cond(urine.glm, I(gravity * 100))
##D plot(urine.cond, which = 4)
## End(Not run)

## House Price Data
data(houses)
houses.rsm <- rsm(price ~ ., family = student(5), data = houses)
##
## parameter of interest: scale parameter
houses.marg <- cond(houses.rsm, scale)
plot(houses.marg, which = 2)



