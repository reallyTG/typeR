library(bamlss)


### Name: smooth.construct
### Title: Constructor Functions for Smooth Terms in BAMLSS
### Aliases: smooth.construct smooth.construct.bamlss.frame
###   smooth.construct.bamlss.formula smooth.construct.bamlss.terms
### Keywords: models smooth regression

### ** Examples

## Generate some data.
d <- GAMart()

## Create a "bamlss.frame".
bf <- bamlss.frame(num ~ s(x1) + s(x2), data = d)

## Extract the smooth construct.
sc <- smooth.construct(bf)
str(sc)

## Also possible with formulas.
f <- bamlss.formula(list(
  num ~ s(x1) + te(lon,lat),
  sigma ~ s(x2)
), family = "gaussian")

sc <- smooth.construct(f, data = d)
str(sc)



