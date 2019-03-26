library(popEpi)


### Name: is.Date
### Title: Test if object is a 'Date' object
### Aliases: is.Date

### ** Examples

## the base "capital Date" format
da <- as.Date("2000-01-01")
is.Date(da) ## TRUE
date::is.date(da) ## FALSE

## IDate format from data.table
library("data.table")
da <- as.IDate("2000-01-01")
is.Date(da) ## TRUE
date::is.date(da) ## FALSE

## from package "date"
da <- date::as.date("1jan2000")
is.Date(da) ## FALSE
date::is.date(da) ## TRUE
 



