library(censReg)


### Name: coef.summary.censReg
### Title: Coefficients of Censored Regression Models and their Statistical
###   Properties
### Aliases: coef.summary.censReg
### Keywords: methods

### ** Examples

## Kleiber & Zeileis ( 2008 ), page 142
data( "Affairs", package = "AER" )
estResult <- censReg( affairs ~ age + yearsmarried + religiousness +
   occupation + rating, data = Affairs )
coef( summary( estResult ) )



