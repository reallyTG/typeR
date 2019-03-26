library(censReg)


### Name: summary.censReg
### Title: Summary Results of Censored Regression Models
### Aliases: summary.censReg print.summary.censReg
### Keywords: methods

### ** Examples

## Kleiber & Zeileis ( 2008 ), page 142
data( "Affairs", package = "AER" )
estResult <- censReg( affairs ~ age + yearsmarried + religiousness +
   occupation + rating, data = Affairs )
summary( estResult )



