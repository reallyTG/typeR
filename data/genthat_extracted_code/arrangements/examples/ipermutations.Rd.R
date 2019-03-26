library(arrangements)


### Name: Permutations
### Title: Permutations iterator
### Aliases: Permutations ipermutations
### Keywords: datasets

### ** Examples

iperm <- ipermutations(5, 2)
iperm$getnext()
iperm$getnext(2)
iperm$getnext(layout = "column", drop = FALSE)
# collect remaining permutations
iperm$collect()

library(foreach)
foreach(x = ipermutations(5, 2), .combine=c) %do% {
  sum(x)
}



