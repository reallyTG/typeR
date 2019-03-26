library(EWGoF)


### Name: WPP.test
### Title: GoF tests based on the Weibull probability plot for the Weibull
###   distribution
### Aliases: WPP.test
### Keywords: Stabilized Weibull probability plot Shapiro-Wilk GoF tests
###   smooth tests skewness kurtosis Weibull probability plot WPP
###   Ozturk-Korukoglu test Smith-Bain test

### ** Examples

x <- rlnorm(10,3)

#Apply the Ozturk-Korukoglu test
## Not run: 
##D  WPP.test(x,type="OK")
##D  
## End(Not run)


# Apply the generalized smooth test based on the kurtosis 
## Not run: 
##D WPP.test(x,type="ST1")
## End(Not run)




