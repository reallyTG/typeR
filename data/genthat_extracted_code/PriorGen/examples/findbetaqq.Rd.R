library(PriorGen)


### Name: findbetaqq
### Title: The findbetaqq function
### Aliases: findbetaqq
### Keywords: ~kwd1 ~kwd2

### ** Examples

##Example 1
##We believe that 20% of the units in an area/region have a prevalence of
##disease/infection less than or equal to 0.30 while at the same time we are 90%
##certain that the prevalence is less than 0.60

findbetaqq(percentile.value1=0.30,percentile1=0.20,percentile.value2=0.60,percentile2=0.90)

##The output is:
##[1] "The desired Beta distribution that satisfies the specified conditions is:
##Beta( 5.19 7.17 )"
##[1] "Here is a plot of the specified distribution."
##[1] "Descriptive statistics for this distribution are:"
##   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
##0.02999 0.31999 0.41419 0.41974 0.51413 0.85487
##[1] "Verification: The first percentile value 0.3 corresponds to the 0.2 th
##percentile"
##[1] "Verification: The second percentile value 0.6 corresponds to the 0.9 th
##percentile"



