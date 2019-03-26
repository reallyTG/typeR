library(momentchi2)


### Name: wf
### Title: Wood's F method
### Aliases: wf
### Keywords: distribution

### ** Examples

#Examples taken from Table 18.6 in N. L. Johnson, S. Kotz, N. Balakrishnan.
#Continuous Univariate Distributions, Volume 1, John Wiley & Sons, 1994.

wf(c(1.5, 1.5, 0.5, 0.5), 10.203)            # should give value close to 0.95
wf(coeff=c(1.5, 1.5, 0.5, 0.5), x=10.203)    # specifying parameters
wf(c(1.5, 1.5, 0.5, 0.5), c(0.627, 10.203))  # x is a vector, output approx. 0.05, 0.95
wf(c(0.9), 1)                                # pathological case, warning, uses hbe()



