library(ltm)


### Name: ltm
### Title: Latent Trait Model - Latent Variable Model for Binary Data
### Aliases: ltm
### Keywords: multivariate regression

### ** Examples

## The two-parameter logistic model for the WIRS data
## with the constraint that (i) the easiness parameter 
## for the 1st item equals 1 and (ii) the discrimination
## parameter for the 6th item equals -0.5

ltm(WIRS ~ z1, constr = rbind(c(1, 1, 1), c(6, 2, -0.5)))


## One-factor and a quadratic term
## using the Mobility data
ltm(Mobility ~ z1 + I(z1^2))

## Two-factor model with an interaction term
## using the WIRS data
ltm(WIRS ~ z1 * z2)


## The two-parameter logistic model for the Abortion data 
## with 20 quadrature points and 20 EM iterations;
## report results under the usual IRT parameterization
ltm(Abortion ~ z1, control = list(GHk = 20, iter.em = 20))




