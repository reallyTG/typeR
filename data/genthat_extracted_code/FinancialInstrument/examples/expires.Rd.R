library(FinancialInstrument)


### Name: expires
### Title: extract the correct expires value from an 'instrument'
### Aliases: expires

### ** Examples

## Not run: 
##D instr <- instrument("FOO_U1", currency=currency("USD"), multiplier=1,
##D                     expires=c("2001-09-01", "2011-09-01", "2021-09-01"), 
##D                     assign_i=FALSE)
##D #Last value of expires that's not after Sys.Date
##D expires(instr) 
##D # First value of expires that hasn't already passed.
##D expires(instr, expired=FALSE)
##D # last value that's not after 2011-01-01
##D expires(instr, Date="2011-01-01") 
##D # first value that's not before 2011-01-01
##D expires(instr, Date="2011-01-01", expired=FALSE) 
##D 
##D ## expires.character
##D expires("FOO_U1") # warning that FOO_U1 is not defined
##D instrument("FOO_U1", currency=currency("USD"), multiplier=1,
##D            expires=c("2001-09-01", "2011-09-01", "2021-09-01"), 
##D            assign_i=TRUE)
##D expires("FOO_U1")
## End(Not run)



