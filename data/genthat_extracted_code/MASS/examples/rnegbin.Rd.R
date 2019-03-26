library(MASS)


### Name: rnegbin
### Title: Simulate Negative Binomial Variates
### Aliases: rnegbin
### Keywords: distribution

### ** Examples

# Negative Binomials with means fitted(fm) and theta = 4.5
fm <- glm.nb(Days ~ ., data = quine)
dummy <- rnegbin(fitted(fm), theta = 4.5)



