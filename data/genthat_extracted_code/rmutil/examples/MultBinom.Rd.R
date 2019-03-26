library(rmutil)


### Name: Multiplicative Binomial
### Title: Multiplicative Binomial Distribution
### Aliases: dmultbinom pmultbinom qmultbinom rmultbinom
### Keywords: distribution

### ** Examples

# compute P(45 < y < 55) for y multiplicative binomial(100,0.5,1.1)
sum(dmultbinom(46:54, 100, 0.5, 1.1))
pmultbinom(54, 100, 0.5, 1.1)-pmultbinom(45, 100, 0.5, 1.1)
pmultbinom(2,10,0.5,1.1)
qmultbinom(0.025,10,0.5,1.1)
rmultbinom(10,10,0.5,1.1)



