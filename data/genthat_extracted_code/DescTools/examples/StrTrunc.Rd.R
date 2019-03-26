library(DescTools)


### Name: StrTrunc
### Title: Truncate Strings and Add Ellipses If a String is Truncated.
### Aliases: StrTrunc
### Keywords: character utilities

### ** Examples

set.seed(1789)
x <- sapply(seq(10),  function(x) paste(sample(letters, sample(20,1)),collapse=""))
x

StrTrunc(x, maxlen=10)

# right justification
formatC(StrTrunc(x, maxlen=10), width = 10, flag=" ")



