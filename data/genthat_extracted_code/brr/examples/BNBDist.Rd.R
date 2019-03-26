library(brr)


### Name: BNBDist
### Title: Beta-negative binomial distribution
### Aliases: BNBDist dbeta_nbinom pbeta_nbinom qbeta_nbinom rbeta_nbinom
###   sbeta_nbinom summary_beta_nbinom

### ** Examples

a <- 2 ; c <- 5 ; d <- 30
barplot(dbeta_nbinom(0:50, a, c, d), names=0:50)
summary_beta_nbinom(a, c, d)



