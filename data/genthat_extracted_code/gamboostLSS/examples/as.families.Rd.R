library(gamboostLSS)


### Name: as.families
### Title: Include 'gamlss' families in the boosting framework of
###   'gamboostLSS'
### Aliases: as.families gamlss.Families gamlss1parMu gamlss2parMu
###   gamlss2parSigma gamlss3parMu gamlss3parSigma gamlss3parNu
###   gamlss4parMu gamlss4parSigma gamlss4parNu gamlss4parTau
### Keywords: models distributions

### ** Examples

## simulate small example
set.seed(123)
x <- runif(1000)

y <- rnorm(mean = 2 + 3 * x,        # effect on mu
           sd   = exp( 1 - 1 * x ), # effect on sigma
           n    = 1000)

## boosting
glmss <- glmboostLSS(y ~ x, families = as.families("NO"))
## the same:
if (require("gamlss.dist")) {
    glmss <- glmboostLSS(y ~ x, families = as.families(NO))
    glmss <- glmboostLSS(y ~ x, families = as.families(NO()))
}

coef(glmss, off2int = TRUE)

## compare to gamlss
library(gamlss)
glmss2 <- gamlss(y ~ x, sigma.formula = ~x, family = "NO")
coef(glmss2)
glmss2$sigma.coef




