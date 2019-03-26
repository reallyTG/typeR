library(RBesT)


### Name: mixdiff
### Title: Difference of mixture distributions
### Aliases: mixdiff dmixdiff pmixdiff qmixdiff rmixdiff

### ** Examples


# 1. Difference between two beta distributions, i.e. Pr( mix1 - mix2 > 0)
mix1 <- mixbeta(c(1, 11, 4))
mix2 <- mixbeta(c(1, 8, 7))
pmixdiff(mix1, mix2, 0, FALSE)

# Interval probability, i.e. Pr( 0.3 > mix1 - mix2 > 0)
pmixdiff(mix1, mix2, 0.3) - pmixdiff(mix1, mix2, 0)

# 2. two distributions, one of them a mixture
m1 <- mixbeta( c(1,30,50))
m2 <- mixbeta( c(0.75,20,50),c(0.25,1,1))

# random sample of difference
set.seed(23434)
rM <- rmixdiff(m1, m2, 1E4)

# histogram of random numbers and exact density
hist(rM,prob=TRUE,new=TRUE,nclass=40)
curve(dmixdiff(m1,m2,x), add=TRUE, n=51)

# threshold probabilities for difference, at 0 and 0.2
pmixdiff(m1, m2, 0)
mean(rM<0)
pmixdiff(m1,m2,0.2)
mean(rM<0.2)

# median of difference
mdn <- qmixdiff(m1, m2, 0.5)
mean(rM<mdn)

# 95%-interval
qmixdiff(m1, m2, c(0.025,0.975))
quantile(rM, c(0.025,0.975))




