library(actuar)


### Name: ZeroModifiedNegativeBinomial
### Title: The Zero-Modified Negative Binomial Distribution
### Aliases: ZeroModifiedNegativeBinomial ZMNegativeBinomial ZMNegBinomial
###   dzmnbinom pzmnbinom qzmnbinom rzmnbinom
### Keywords: distribution

### ** Examples

## Example 6.3 of Klugman et al. (2012)
p <- 1/(1 + 0.5)
dzmnbinom(1:5, size = 2.5, prob = p, p0 = 0.6)
(1-0.6) * dnbinom(1:5, 2.5, p)/pnbinom(0, 2.5, p, lower = FALSE) # same

## simple relation between survival functions
pzmnbinom(0:5, 2.5, p, p0 = 0.2, lower = FALSE)
(1-0.2) * pnbinom(0:5, 2.5, p, lower = FALSE) /
    pnbinom(0, 2.5, p, lower = FALSE) # same

qzmnbinom(pzmnbinom(0:10, 2.5, 0.3, p0 = 0.1), 2.5, 0.3, p0 = 0.1)



