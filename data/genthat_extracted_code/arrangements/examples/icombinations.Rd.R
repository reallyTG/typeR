library(arrangements)


### Name: Combinations
### Title: Combinations iterator
### Aliases: Combinations icombinations
### Keywords: datasets

### ** Examples

icomb <- icombinations(5, 2)
icomb$getnext()
icomb$getnext(2)
icomb$getnext(layout = "column", drop = FALSE)
# collect remaining combinations
icomb$collect()

library(foreach)
foreach(x = icombinations(5, 2), .combine=c) %do% {
  sum(x)
}



