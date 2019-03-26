library(Sequential)


### Name: SampleSize.Binomial
### Title: Sample size calculation for continuous sequential analysis with
###   binomial data.
### Aliases: SampleSize.Binomial
### Keywords: Continuous MaxSPRT analysis

### ** Examples


result<- SampleSize.Binomial(RR=5,alpha=0.01,power=0.88,M=1,z=2)
# if you type:
result
# then you will get the following output:
# $Required_N
# [1] 25

# $cv
# [1] 4.59581

# $Type_I_Error
# [1] 0.009755004

# $Actual_power
# [1] 0.8855869




