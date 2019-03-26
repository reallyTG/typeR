library(bamlss)


### Name: model.matrix.bamlss.frame
### Title: Construct/Extract BAMLSS Design Matrices
### Aliases: model.matrix.bamlss.frame model.matrix.bamlss.formula
###   model.matrix.bamlss.terms
### Keywords: manip regression models

### ** Examples

## Generate some data.
d <- GAMart()

## Model formula.
f <- list(
  num ~ x1 + x2 + id,
  sigma ~ x3 + fac + lon + lat
)

## Create a "bamlss.frame".
bf <- bamlss.frame(f, data = d)

## Get the model matrices.
X <- model.matrix(bf)
head(X$sigma)

## Same with "bamlss.formula".
X <- model.matrix(bamlss.formula(f), data = d)
head(X$sigma)



