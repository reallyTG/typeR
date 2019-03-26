library(censReg)


### Name: coef.censReg
### Title: Coefficients, their Covariances, and Log-Likelihood Values of
###   Censored Regression Models
### Aliases: coef.censReg vcov.censReg logLik.censReg
### Keywords: methods

### ** Examples

## Kleiber & Zeileis ( 2008 ), page 142
data( "Affairs", package = "AER" )
estResult <- censReg( affairs ~ age + yearsmarried + religiousness +
   occupation + rating, data = Affairs )
coef( estResult )
coef( estResult, logSigma = FALSE )
vcov( estResult )
vcov( estResult, logSigma = FALSE )
logLik( estResult )



