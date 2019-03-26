library(qdapTools)


### Name: lookup_e
### Title: Hash Table/Dictionary Lookup 'lookup_e' - Environment based hash
###   table useful for large vector lookups.
### Aliases: lookup_e lookup_e.matrix lookup_e.data.frame lookup_e.list
###   lookup_e.numeric lookup_e.factor lookup_e.character %le% %le+%
### Keywords: dictionary, hash, lookup

### ** Examples

lookup_e(1:5, data.frame(1:4, 11:14))

## Retain original values for missing
lookup_e(1:5, data.frame(1:4, 11:14), missing=NULL)

lookup_e(LETTERS[1:5], data.frame(LETTERS[1:5], 100:104))
lookup_e(LETTERS[1:5], factor(LETTERS[1:5]), 100:104)

## Supply a named list of vectors to key.match

codes <- list(
    A = c(1, 2, 4),
    B = c(3, 5),
    C = 7,
    D = c(6, 8:10)
)

lookup_e(1:10, codes)

## Supply a single vector to key.match and key.reassign

lookup_e(mtcars$carb, sort(unique(mtcars$carb)),
    c("one", "two", "three", "four", "six", "eight"))

lookup_e(mtcars$carb, sort(unique(mtcars$carb)),
    seq(10, 60, by=10))

## %le%, a binary operator version of lookup
1:5 %le% data.frame(1:4, 11:14)
1:10 %le% codes

1:12 %le% codes
1:12 %le+% codes



