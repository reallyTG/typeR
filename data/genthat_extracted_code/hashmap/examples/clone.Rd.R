library(hashmap)


### Name: clone
### Title: Clone a Hashmap
### Aliases: clone

### ** Examples


x <- hashmap(letters[1:5], 1:5)

## shallow copy
y <- x
y[["a"]] <- 999

## original is affected
x[["a"]] == 999

z <- clone(x)
z[["c"]] <- 888

## original not affected
x[["c"]] == 888



