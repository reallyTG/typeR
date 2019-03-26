library(mondate)


### Name: format.mondate
### Title: Format a mondate
### Aliases: format.mondate

### ** Examples

(b<-mondate(1))   # end of first month of millennium
format(b)         # "01/31/2000" -- with quotes -- in the U.S. locale
format(b, format="%Y-%m-%d")  # "2000-12-31"



