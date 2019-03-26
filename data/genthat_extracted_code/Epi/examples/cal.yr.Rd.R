library(Epi)


### Name: cal.yr
### Title: Functions to convert character, factor and various date objects
###   into a number, and vice versa.
### Aliases: cal.yr as.Date.cal.yr
### Keywords: manip chron

### ** Examples

 # Character vector of dates:
 birth <- c("14/07/1852","01/04/1954","10/06/1987","16/05/1990",
            "12/11/1980","01/01/1997","01/01/1998","01/01/1999")
 # Proper conversion to class "Date":
 birth.dat <- as.Date( birth, format="%d/%m/%Y" )
 # Converson of character to class "cal.yr"
 bt.yr <- cal.yr( birth, format="%d/%m/%Y" )
 # Back to class "Date":
 bt.dat <- as.Date( bt.yr )
 # Numerical calculation of days since 1.1.1970:
 days <- Days <- (bt.yr-1970)*365.25
 # Blunt assignment of class:
 class( Days ) <- "Date"
 # Then data.frame() to get readable output of results:
 data.frame( birth, birth.dat, bt.yr, bt.dat, days, Days, round(Days) )



