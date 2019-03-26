library(ICSNP)


### Name: rank.ctest
### Title: One, Two and C Sample Rank Tests for Location based on Marginal
###   Ranks
### Aliases: rank.ctest rank.ctest.default rank.ctest.formula
###   rank.ctest.ics
### Keywords: htest multivariate nonparametric

### ** Examples

# one sample tests:

data(pulmonary)

rank.ctest(pulmonary, scores = "sign")
rank.ctest(pulmonary, mu = c(0,0,2))

# two sample tests:

set.seed(123456)
X <- rmvnorm(20, c(0,0,0,0), diag(1:4))
Y <- rmvnorm(30, c(0.5,0.5,0.5,0.5), diag(1:4))
Z <- rbind(X,Y)
g <- factor(rep(c(1,2), c(20,30)))

rank.ctest(X, Y, scores = "normal")
rank.ctest(Z~g, scores = "sign", mu = rep(-0.5,4))

# c sample test:

W <- rmvnorm(30, c(0,0,0,0), diag(1:4))
Z2 <- rbind(X,Y,W)
g2 <- factor(rep(1:3, c(20,30,30)))

rank.ctest(Z2~g2, scores = "normal")

# in an invariant coordinate system

rank.ctest(ics(Z2,covOrigin, cov4, S2args=list(location =
           "Origin")), index = c(1,4), scores = "sign")

rank.ctest(ics(Z), g, index = 4)

rank.ctest(ics(Z2), g2, scores = "normal",index = 4)

rm(.Random.seed)
         


