library(bamlss)


### Name: terms.bamlss
### Title: BAMLSS Model Terms
### Aliases: terms.bamlss terms.bamlss.frame terms.bamlss.formula
### Keywords: regression models

### ** Examples

## Model formula.
f <- list(
  num ~ x1 + x2 + id,
  sigma ~ x3 + fac + lon + lat
)

## Create the terms object.
terms(bamlss.formula(f))



