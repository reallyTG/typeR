library(scales)


### Name: trans_breaks
### Title: Pretty breaks on transformed scale.
### Aliases: trans_breaks

### ** Examples

trans_breaks("log10", function(x) 10 ^ x)(c(1, 1e6))
trans_breaks("sqrt", function(x) x ^ 2)(c(1, 100))
trans_breaks(function(x) 1 / x, function(x) 1 / x)(c(1, 100))
trans_breaks(function(x) -x, function(x) -x)(c(1, 100))



