library(PriorGen)


### Name: findbeta
### Title: The findbeta function
### Aliases: findbeta
### Keywords: ~kwd1 ~kwd2

### ** Examples

##Example 1
##Based on the available literature the mean value for the sensitivity of a test
##is expected to be 0.90 and we can be 95% sure that it is higher than 0.80.

findbeta(themean=0.90, percentile=0.95,lower.v=FALSE, percentile.value=0.80)

## The output is:
##[1] "The desired Beta distribution that satisfies the specified conditions is:
##Beta( 27.79 3.09 )"
##[1] "Here is a plot of the specified distribution."
##[1] "Descriptive statistics for this distribution are:"
##   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
## 0.6192  0.8688  0.9077  0.8996  0.9391  0.9974
##[1] "Verification: The percentile value 0.8 corresponds to the 0.05th
##percentile


##Example 2
##Based on the available literature the median value for the specificity of a
##test is expected to be 0.99 and we can be 95% sure that it is higher than
##0.90.

findbeta(themedian=0.99, percentile=0.95,lower.v=FALSE, percentile.value=0.90)

## The output is:
##[1] "The desired Beta distribution that satisfies the specified conditions is:
##Beta( 18.97 0.52 )"
##[1] "Here is a plot of the specified distribution."
##[1] "Descriptive statistics for this distribution are:"
##   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
## 0.5634  0.9637  0.9871  0.9735  0.9970  1.0000
##[1] "Verification: The percentile value 0.9 corresponds to the 0.05th
##percentile"

##Example 3
##The most probable value (mode) for the prevalence of a disease/infection in a
##population is expected to be 0.15 and we are 90% sure that it is less that
##0.40.

findbeta(themode=0.15, percentile=0.90,lower.v=TRUE, percentile.value=0.40)

## The output is:
##[1] "The desired Beta distribution that satisfies the specified conditions is:
##Beta( 2.15 7.52 )"
##[1] "Here is a plot of the specified distribution."
##[1] "Descriptive statistics for this distribution are:"
##    Min.  1st Qu.   Median     Mean  3rd Qu.     Max.
##0.001939 0.125475 0.204776 0.223724 0.300515 0.785156
##[1] "Verification: The percentile value 0.4 corresponds to the 0.9th
##percentile"







