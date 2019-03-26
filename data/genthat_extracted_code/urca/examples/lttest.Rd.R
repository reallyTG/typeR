library(urca)


### Name: lttest
### Title: Likelihood ratio test for no linear trend in VAR
### Aliases: lttest
### Keywords: regression

### ** Examples

data(denmark)
sjd <- as.matrix(denmark[, c("LRM", "LRY", "IBO", "IDE")])
sjd.vecm <- ca.jo(sjd, ecdet = "const", type="eigen", K=2, spec="longrun",
season=4)
lttest(sjd.vecm, r=1)
#
data(finland)
sjf <- as.matrix(finland)
sjf.vecm <- ca.jo(sjf, ecdet = "none", type="eigen", K=2,
spec="longrun", season=4)
lttest(sjf.vecm, r=3)



