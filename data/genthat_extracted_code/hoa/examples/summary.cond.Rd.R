library(hoa)


### Name: summary.cond
### Title: Summary Method for Objects of Class "cond"
### Aliases: summary.cond
### Keywords: regression methods

### ** Examples

## Crying Babies Data
data(babies)
babies.glm <- glm(formula = cbind(r1, r2) ~ day + lull - 1, 
                  family = binomial, data = babies)
babies.cond <- cond(object = babies.glm, offset = lullyes)
summary(babies.cond, test = 0, coef = FALSE)



