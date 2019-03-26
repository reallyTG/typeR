library(MF)


### Name: HLBoot
### Title: Bootstrap CI for MF, HL, and Qdif
### Aliases: HLBoot

### ** Examples

HLBoot(lesion~group,calflung)

#  Bootstrapping . . . . . . . . . . . .
#
#  10000 bootstrap samples
#  95% confidence intervals
#  Comparing vac to con
#
#
#  Mitigated Fraction
#
#                  observed median  lower  upper
#  Equal Tailed        0.44 0.4464 0.1264 0.7056
#  Highest Density     0.44 0.4464 0.1392 0.7120
#
#
#  Hodges-Lehmann
#
#                  observed   median      lower    upper
#  Equal Tailed    -0.07335 -0.07125 -0.1720537 -0.01430
#  Highest Density -0.07335 -0.07125 -0.1563500 -0.00555
#
#
#  Quartile Differences (quartiles of vac - quartiles of con)
#
#       observed    median      lower     upper
#  Q25 -0.041500 -0.041300 -0.1034000 -0.000905
#  Q50 -0.112525 -0.111175 -0.2811688  0.023200
#  Q75 -0.168000 -0.168000 -0.3858500  0.023975



