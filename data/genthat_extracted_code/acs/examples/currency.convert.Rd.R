library(acs)


### Name: currency.convert
### Title: Convert dollar values of acs object to a new base year.
### Aliases: currency.convert currency.convert,acs-method

### ** Examples

lawrence10                                   # median income data, endyear = 2010
currency.convert(lawrence10, newyear=2014)   # convert $$ to 2014 dollars 
currency.convert(lawrence10, newyear=1929)   # convert $$ to 1929 dollars



