library(urca)


### Name: alrtest
### Title: Likelihood ratio test for restrictions on alpha
### Aliases: alrtest
### Keywords: regression

### ** Examples

data(denmark)
sjd <- denmark[, c("LRM", "LRY", "IBO", "IDE")]
sjd.vecm <- ca.jo(sjd, ecdet = "const", type="eigen", K=2, spec="longrun",
season=4)
DA <- matrix(c(1,0,0,0), c(4,1))
summary(alrtest(sjd.vecm, A=DA, r=1))



