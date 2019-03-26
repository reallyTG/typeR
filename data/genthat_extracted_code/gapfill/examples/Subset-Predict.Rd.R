library(gapfill)


### Name: Subset-Predict
### Title: Subset and Predict Functions
### Aliases: Subset-Predict Subset Predict fnSubset fnPredict Predict

### ** Examples

## Assume we choose c(5, 5, 1, 5) as initalSize of the subset
iS <- c(5, 5, 1, 5)
## case 1: initial subset leads to prediction -------
i <- 0
a <- Subset(data = ndvi, mp = c(1, 3, 1, 2), i = i, initialSize = iS)
p <- Predict(a = a, i = i)
p
stopifnot(identical(a, ArrayAround(data = ndvi, mp = c(1, 3, 1, 2),
                                   size = c(5 + i, 5 + i, 1, 5))))
stopifnot(identical(p, Gapfill(data = ndvi, subset = 1807,
                               initialSize = iS, verbose = FALSE)$fill[1807]))

## case 2: two tries are necessary ------------------
i <- 0
a <- Subset(data = ndvi, mp = c(20, 1, 1, 2), i = i, initialSize = iS)
p <- Predict(a = a, i = i)
p

## Increase i and try again.
i <- i + 1
a <- Subset(data = ndvi, mp = c(20, 1, 1, 2), i = i, initialSize = iS)
p <- Predict(a = a, i = i)
p
stopifnot(identical(a, ArrayAround(data = ndvi, mp = c(20, 1, 1, 2),
                                   size = c(5 + i, 5 + i, 1, 6))))
stopifnot(identical(p, Gapfill(data = ndvi, subset = 1784,
                               initialSize = iS, verbose = FALSE)$fill[1784]))



