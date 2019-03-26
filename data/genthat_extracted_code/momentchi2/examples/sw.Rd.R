library(momentchi2)


### Name: sw
### Title: Satterthwaite-Welch method
### Aliases: sw
### Keywords: distribution

### ** Examples

#Examples taken from Table 18.6 in N. L. Johnson, S. Kotz, N. Balakrishnan.
#Continuous Univariate Distributions, Volume 1, John Wiley & Sons, 1994.

sw(c(1.5, 1.5, 0.5, 0.5), 10.203)            # should give value close to 0.95
sw(coeff=c(1.5, 1.5, 0.5, 0.5), x=10.203)    # specifying parameters
sw(c(1.5, 1.5, 0.5, 0.5), c(0.627, 10.203))  # x is a vector, output close to 0.05, 0.95



