library(gma)


### Name: gma
### Title: Granger Mediation Analysis of Time Series
### Aliases: gma
### Keywords: models

### ** Examples

# Example with simulated data

##############################################################################
# Single level GMA model
# Data was generated with 500 time points.
# The correlation between Gaussian white noise is 0.5.
data(env.single)
data.SL<-get("data1",env.single)

## Example 1: Given delta is 0.5.
gma(data.SL,model.type="single",delta=0.5)
# $Coefficients
#          Estimate         SE         LB         UB
# A     0.519090451 0.06048910  0.4005340  0.6376469
# C     0.487396067 0.12650909  0.2394428  0.7353493
# B    -0.951262962 0.07693595 -1.1020547 -0.8004713
# C2   -0.006395453 0.12125003 -0.2440411  0.2312502
# AB.p -0.493791520 0.07004222 -0.6310717 -0.3565113
# AB.d -0.493791520 0.17523161 -0.8372392 -0.1503439

## Example 2: Assume the white noise are independent.
gma(data.SL,model.type="single",delta=0)
# $Coefficients
#          Estimate         SE          LB         UB
# A     0.519090451 0.06048910  0.40053400 0.63764690
# C    -0.027668910 0.11136493 -0.24594015 0.19060234
# B     0.040982178 0.07693595 -0.10980952 0.19177387
# C2   -0.006395453 0.12125003 -0.24404115 0.23125024
# AB.p  0.021273457 0.04001358 -0.05715172 0.09969864
# AB.d  0.021273457 0.16463207 -0.30139946 0.34394638

## Example 3: Sensitivity analysis (given delta is 0.5)
# We comment out the example due to the computation time.
# gma(data.SL,model.type="single",delta=0.5,sens.plot=TRUE)
##############################################################################

##############################################################################
# Two-level GMA model
# Data was generated with 50 subjects.
# The correlation between white noise in the single level model is 0.5.
# The time series is generate from a VAR(1) model.
# We comment out our examples due to the computation time.
data(env.two)
data.TL<-get("data2",env.two)

## Example 1: Correlation is unknown and to be estimated.
# Assume errors in the coefficients model are independent.
# Add an interval constraint on the variance components.

# "HL" method
# gma(data.TL,model.type="twolevel",method="HL",p=1)
# $delta
# [1] 0.5176206
# 
# $Coefficients
#           Estimate
# A        0.5587349
# C        0.7129338
# B       -1.0453097
# C2       0.1213349
# AB.prod -0.5840510
# AB.diff -0.5915989
# 
# $time
#   user  system elapsed 
# 12.285   0.381  12.684 

# "TS" method
# gma(data.TL,model.type="twolevel",method="TS",p=1)
# $delta
# [1] 0.4993492
# 
# $Coefficients
#           Estimate
# A        0.5569101
# C        0.6799228
# B       -0.9940383
# C2       0.1213349
# AB.prod -0.5535900
# AB.diff -0.5585879
# 
# $time
#  user  system elapsed 
# 7.745   0.175   7.934 

## Example 2: Given the correlation is 0.5.
# Assume errors in the coefficients model are independent.
# Add an interval constraint on the variance components.

# "HL" method
# gma(data.TL,model.type="twolevel",method="HL",delta=0.5,p=1)
# $delta
# [1] 0.5
# 
# $Coefficients
#           Estimate
# A        0.5586761
# C        0.6881703
# B       -0.9997898
# C2       0.1213349
# AB.prod -0.5585587
# AB.diff -0.5668355
# 
# $time
#  user  system elapsed 
# 0.889   0.023   0.913
##############################################################################



