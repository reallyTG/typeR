library(censReg)


### Name: censReg
### Title: Censored Regression (Tobit) Model
### Aliases: censReg print.censReg
### Keywords: models regression

### ** Examples

## Kleiber & Zeileis ( 2008 ), page 142
data( "Affairs", package = "AER" )
estResult <- censReg( affairs ~ age + yearsmarried + religiousness +
   occupation + rating, data = Affairs )
print( estResult )

## Kleiber & Zeileis ( 2008 ), page 143
estResultBoth <- censReg( affairs ~ age + yearsmarried + religiousness +
   occupation + rating, data = Affairs, right = 4 )
print( estResultBoth )



