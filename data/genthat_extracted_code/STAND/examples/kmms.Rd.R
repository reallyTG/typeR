library(STAND)


### Name: kmms
### Title: Kaplan-Meier (KM) Mean and Standard Error
### Aliases: kmms
### Keywords: nonparametric htest

### ** Examples

# results for beTWA data using kmms in stand Ver 1.1 with error
#    KM.mean      KM.LCL      KM.UCL       KM.se       gamma 
# 0.018626709 0.014085780 0.023167637 0.002720092 0.950000000
#
data(beTWA) # Use data from Example 2 in ORNLTM2002-51
unlist(kmms(beTWA))



