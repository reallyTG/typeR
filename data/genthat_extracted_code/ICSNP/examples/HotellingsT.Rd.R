library(ICSNP)


### Name: HotellingsT2
### Title: Hotelling's T2 Test
### Aliases: HotellingsT2 HotellingsT2.default HotellingsT2.formula
### Keywords: htest multivariate

### ** Examples
 
# one sample test:

data(pulmonary)

HotellingsT2(pulmonary) 
HotellingsT2(pulmonary, mu = c(0,0,2), test = "chi")

# two sample test:

set.seed(123456)
X <- rmvnorm(20, c(0, 0, 0, 0), diag(1:4))
Y <- rmvnorm(30, c(0.5, 0.5, 0.5, 0.5), diag(1:4))
Z <- rbind(X, Y)
g <- factor(rep(c(1,2),c(20,30)))

HotellingsT2(X, Y)
HotellingsT2(Z ~ g, mu = rep(-0.5,4))

rm(.Random.seed) 


