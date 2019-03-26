library(ivmte)


### Name: genGamma
### Title: Estimating expectations of terms in the MTR (gamma objects)
### Aliases: genGamma

### ** Examples

## Declare MTR formula
formula0 = ~ 1 + u

## Construct MTR polynomials
polynomials0 <- polyparse(formula = formula0,
                data = dtm,
                uname = u,
                as.function = FALSE)

## Construct propensity score model
propensityObj <- propensity(formula = d ~ z,
                            data = dtm,
                            link = "linear")

## Generate gamma moments, with S-weight equal to its default value
## of 1
genGamma(monomials = polynomials0,
         lb = 0,
         ub = propensityObj$phat)




