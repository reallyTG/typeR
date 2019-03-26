library(EQUIVNONINF)


### Name: sgnrk
### Title: Signed rank test for equivalence of an arbitrary continuous
###   distribution of the intraindividual differences in terms of the
###   probability of a positive sign of a Walsh average: test statistic and
###   critical upper bound
### Aliases: sgnrk
### Keywords: nonparametric paired-sample equivalence test continuous
###   observations Walsh averages asymptotic normality

### ** Examples

d <- c(-0.5,0.333,0.667,1.333,1.5,-2.0,-1.0,-0.167,1.667,0.833,-2.167,-1.833,
       4.5,-7.5,2.667,3.333,-4.167,5.667,2.333,-2.5)
sgnrk(0.05,20,0.2398,0.7602,d)



