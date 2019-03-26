library(PriorGen)


### Name: findbetamupsi
### Title: The findbetamupsi function
### Aliases: findbetamupsi
### Keywords: ~kwd1 ~kwd2

### ** Examples

##Example 1
##The mean prevalence of a disease/infection for the units within an area/region
##is thought to be 0.20 and we are 99% confident that it is not more than 0.40.
##Within this area, we are also confident that 90% of all units have a prevalence
##less or equal to 0.50 and we are 95% certain that it does not exceed 0.60

findbetamupsi(themean=0.20, percentile=0.99, lower.v=TRUE,
percentile.value=0.30, psi.percentile=0.90,
percentile.median=0.50, percentile95value=0.60)

##The output is:
##[1] "The desired Beta distribution that satisfies the specified conditions
##about the mean of the prevalence 'mu' is: Beta( 20.27 81.07 )"
##[1] "The desired Gamma distribution that satisfies the specified conditions
##about the variability 'psi' of the prevalence is: Gamma( 8.97 2.79 )"
##[1] "The plot gives the specified prior beleif on the prevalence distribution."
##[1] "Descriptive statistics for this distrubiton are:"
##   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
##0.00000 0.03589 0.13164 0.20156 0.30799 0.99971



