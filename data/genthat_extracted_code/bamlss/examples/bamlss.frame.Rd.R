library(bamlss)


### Name: bamlss.frame
### Title: Create a Model Frame for BAMLSS
### Aliases: bamlss.frame
### Keywords: regression MCMC

### ** Examples

## Create a 'bamlss.frame'.
d <- GAMart()
f <- list(
  num ~ fac + s(x1) + s(x2) + te(lon, lat),
  sigma ~ id + s(x2) + s(x3)
)
bf <- bamlss.frame(f, data = d, family = "gaussian")

## Show parts of the 'bamlss.frame'.
print(bf)

## Categorical responses.
f <- list(
  cat ~ fac + s(x1) + s(x2)
)

bf <- bamlss.frame(f, data = d, family = "multinomial", reference = "low")
print(bf)

## The response is a matrix per default.
head(bf$y)

## 0/1 responses.
d <- cbind(d, model.matrix(~ -1 + cat, data = d))

f <- list(
  catnone ~ fac + s(x1),
  catlow ~ s(x2),
  catmedium ~ s(x3)
)

bf <- bamlss.frame(f, data = d, family = "multinomial")
print(bf)

## Hierarchical structures.
f <- list(
  num ~ s(x1) + s(x2) + id,
  id ~ te(lon, lat),
  sigma ~ s(x1) + fac
)

bf <- bamlss.frame(f, data = d, family = "gaussian")
print(bf)

## Special model term constructors,
## set up "new" constructor function and eval
## with bamlss.frame().
s77 <- function(...) {
  sm <- s(...)
  sm$label <- paste("s77(", paste(sm$term, collapse = ","), ")", sep = "")
  sm
}

f <- list(
  num ~ s77(x1) + s(x2) + id,
  sigma ~ s77(x1)
)

bf <- bamlss.frame(f, data = d, family = "gaussian", specials = "s77")
print(bf)
names(bf$x$mu$smooth.construct)



