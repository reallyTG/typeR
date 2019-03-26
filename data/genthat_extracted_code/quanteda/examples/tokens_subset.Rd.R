library(quanteda)


### Name: tokens_subset
### Title: Extract a subset of a tokens
### Aliases: tokens_subset
### Keywords: tokens

### ** Examples

corp <- corpus(c(d1 = "a b c d", d2 = "a a b e",
                 d3 = "b b c e", d4 = "e e f a b"),
                 docvars = data.frame(grp = c(1, 1, 2, 3)))
toks <- tokens(corp)
# selecting on a docvars condition
tokens_subset(toks, grp > 1)
# selecting on a supplied vector
tokens_subset(toks, c(TRUE, FALSE, TRUE, FALSE))

# selecting on a tokens
toks1 <- tokens(c(d1 = "a b b c", d2 = "b b c d"))
toks2 <- tokens(c(d1 = "x y z", d2 = "a b c c d", d3 = "x x x"))
tokens_subset(toks1, subset = toks2)
tokens_subset(toks1, subset = toks2[c(3,1,2)])



