library(bamlss)


### Name: bamlss.formula
### Title: Formulae for BAMLSS
### Aliases: bamlss.formula
### Keywords: regression

### ** Examples

## Simple formula without family object.
f <- bamlss.formula(y ~ x1 + s(x2))
print(f)
print(str(f))

## Complex formula with list of formulae.
f <- list(
  y1 ~ x1 + s(x2),
  y2 ~ x3 + te(lon, lat),
  u ~ x4 + x1
)

f <- bamlss.formula(f)
print(f)
print(names(f))

## Same formula but using extended formulae
## of package Formula.
f <- y1|y2|u ~ x1 + s(x2)|x3 + te(lon,lat)|x4 + x1
f <- bamlss.formula(f)
print(f)
print(names(f))

## Using a bamlss family object, e.g., gaussian_bamlss().
## The family has two parameters, mu and sigma, for
## each parameter one formula is returned. If no
## formula is specified an intercept only model is
## generated for the respective parameter.
f <- bamlss.formula(y ~ x1 + s(x2), family = gaussian_bamlss)

## Note, same as:
f <- bamlss.formula(y ~ x1 + s(x2), family = "gaussian")
print(f)

## Specify model for parameter sigma, too
f <- list(
  y ~ x1 + s(x2),
  sigma ~ x2 + te(lon, lat)
)
f <- bamlss.formula(f, family = "gaussian")
print(f)

## With complex hierarchical structures,
## each parameter is another list of formulae,
## indicated by the h1,...,hk, names.
f <- list(
  y ~ x1 + s(x2) + id1,
  sigma ~ x2 + te(lon, lat) + id2,
  id1 ~ s(x3) + x4 + s(id3),
  id3 ~ x5 + s(x5, x6),
  id2 ~ x7
)
f <- bamlss.formula(f, family = "gaussian")
print(f)



