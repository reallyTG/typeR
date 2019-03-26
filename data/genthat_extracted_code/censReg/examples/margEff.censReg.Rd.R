library(censReg)


### Name: margEff.censReg
### Title: Marginal Effects in Censored Regression Models
### Aliases: margEff.censReg summary.margEff.censReg
### Keywords: methods

### ** Examples

## Kleiber & Zeileis ( 2008 ), page 142
data( "Affairs", package = "AER" )
estResult <- censReg( affairs ~ age + yearsmarried + religiousness +
   occupation + rating, data = Affairs )
margEff( estResult )
summary( margEff( estResult ) )
margEff( estResult, xValues = c( 1, 40, 4, 2, 4, 4 ) )



