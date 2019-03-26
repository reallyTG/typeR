library(rmutil)


### Name: Beta Binomial
### Title: Beta Binomial Distribution
### Aliases: dbetabinom pbetabinom qbetabinom rbetabinom
### Keywords: distribution

### ** Examples

# compute P(45 < y < 55) for y beta binomial(100,0.5,1.1)
sum(dbetabinom(46:54, 100, 0.5, 1.1))
pbetabinom(54,100,0.5,1.1)-pbetabinom(45,100,0.5,1.1)
pbetabinom(2,10,0.5,1.1)
qbetabinom(0.33,10,0.5,1.1)
rbetabinom(10,10,0.5,1.1)



