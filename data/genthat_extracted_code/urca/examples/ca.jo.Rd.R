library(urca)


### Name: ca.jo
### Title: Johansen Procedure for VAR
### Aliases: ca.jo
### Keywords: regression

### ** Examples

data(denmark)
sjd <- denmark[, c("LRM", "LRY", "IBO", "IDE")]
sjd.vecm <- ca.jo(sjd, ecdet = "const", type="eigen", K=2, spec="longrun",
season=4)
summary(sjd.vecm)
#
data(finland)
sjf <- finland
sjf.vecm <- ca.jo(sjf, ecdet = "none", type="eigen", K=2,
spec="longrun", season=4)
summary(sjf.vecm)



