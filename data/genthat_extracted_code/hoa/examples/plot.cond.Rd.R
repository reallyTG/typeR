library(hoa)


### Name: plot.cond
### Title: Generate Plots for an Approximate Conditional Inference Object
### Aliases: plot.cond
### Keywords: regression methods

### ** Examples

## Crying Babies Data
data(babies)
babies.glm <- glm(formula = cbind(r1, r2) ~ day + lull - 1, 
                  family = binomial, data = babies)
babies.cond <- cond(object = babies.glm, offset = lullyes)
## Not run: 
##D plot(babies.cond)
## End(Not run)

## Urine Data 
data(urine)
urine.glm <- glm(r ~ I(gravity * 100) + ph + osmo + conduct + urea + calc, 
                 family = binomial, data = urine)
urine.cond <- cond(urine.glm, I(gravity * 100))
plot(urine.cond, which=4)



