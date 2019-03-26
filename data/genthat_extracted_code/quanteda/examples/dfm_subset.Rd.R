library(quanteda)


### Name: dfm_subset
### Title: Extract a subset of a dfm
### Aliases: dfm_subset
### Keywords: dfm

### ** Examples

testcorp <- corpus(c(d1 = "a b c d", d2 = "a a b e",
                     d3 = "b b c e", d4 = "e e f a b"),
                   docvars = data.frame(grp = c(1, 1, 2, 3)))
testdfm <- dfm(testcorp)
# selecting on a docvars condition
dfm_subset(testdfm, grp > 1)
# selecting on a supplied vector
dfm_subset(testdfm, c(TRUE, FALSE, TRUE, FALSE))

# selecting on a dfm
dfm1 <- dfm(c(d1 = "a b b c", d2 = "b b c d"))
dfm2 <- dfm(c(d1 = "x y z", d2 = "a b c c d", d3 = "x x x"))
dfm_subset(dfm1, subset = dfm2)
dfm_subset(dfm1, subset = dfm2[c(3,1,2), ])



