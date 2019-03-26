library(mpt)


### Name: mptspec
### Title: Specify a Multinomial Processing Tree (MPT) Model
### Aliases: mptspec print.mptspec update.mptspec
### Keywords: models

### ** Examples

## Specify storage-retrieval model for pairs
spec1 <- mptspec(
  c*r,
  (1 - c)*u^2,
  2*(1 - c)*u*(1 - u),
  c*(1 - r) + (1 - c)*(1 - u)^2
)

## Specify storage-retrieval model with parameter restrictions
spec2 <- mptspec(
  c*r,
  (1 - c)*u^2,
  2*(1 - c)*u*(1 - u),
  c*(1 - r) + (1 - c)*(1 - u)^2,
  .restr = list(c = r/2, u = 0.3)
)

## Optional names identifying trees in joint MPT model
spec3 <- mptspec(
  "1.1" = r + (1 - r)*b,
  "1.2" = (1 - r)*(1 - b),
  "2.1" = b,
  "2.2" = 1 - b
)

## Fit one-high-threshold model to data in Broeder & Schuetz (2009)
mpt1 <- mpt(spec <- mptspec("1HT"), c(55, 35, 45, 765))

## Working with the mptspec object
spec$par2prob(c(0.5, 0.1))        # response probabilities
spec$par2deriv(coef(mpt1))$deriv  # Jacobian matrix at ML estimate

## See ?recogROC for further examples.



