library(devRate)


### Name: compDifDaysDf
### Title: Compute the inverse of the number of days between dates from a
###   data frame.
### Aliases: compDifDaysDf

### ** Examples

myDays <- data.frame(egg =  c("28/12/15", "28/12/15", "28/12/15", "28/12/15"),
                         larva1 = c("12/01/16", "12/01/16", "12/01/16", "13/01/16"),
                         larva2 = c("25/01/16", "26/01/16", "25/01/16", "29/01/16"),
                         pupa = c("12/02/16", "10/02/16", "14/02/16", "09/02/16"),
                         imago = c("28/02/16", "25/02/16", "27/02/16", "26/02/16"),
                         death = c("15/03/16", "12/03/16", "19/03/16", "20/03/16"))
compDifDaysDf(dfDates = myDays, dateFormat = "%d/%m/%y")



