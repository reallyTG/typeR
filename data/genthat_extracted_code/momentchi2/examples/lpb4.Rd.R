library(momentchi2)


### Name: lpb4
### Title: Lindsay-Pilla-Basak method
### Aliases: lpb4
### Keywords: distribution

### ** Examples

#Examples taken from Table 18.6 in N. L. Johnson, S. Kotz, N. Balakrishnan.
#Continuous Univariate Distributions, Volume 1, John Wiley & Sons, 1994.

lpb4(c(1.5, 1.5, 0.5, 0.5), 10.203)            # should give value close to 0.95
lpb4(coeff=c(1.5, 1.5, 0.5, 0.5), x=10.203)    # specifying parameters
lpb4(c(1.5, 1.5, 0.5, 0.5), c(0.627, 10.203))  # x is a vector, output approx 0.05, 0.95
lpb4(c(0.5, 0.3, 0.2), 2.708)                  # length(coeff) < 4, warning, uses hbe()



