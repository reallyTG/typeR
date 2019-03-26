library(datadr)


### Name: kvApply
### Title: Apply Function to Key-Value Pair
### Aliases: kvApply

### ** Examples

kv <- kvPair(1, 2)
kv
kvApply(kv, function(x) x^2)
kvApply(kv, function(k, v) v^2)
kvApply(kv, function(k, v) k + v)
kvApply(kv, function(x) kvPair("new_key", x))



