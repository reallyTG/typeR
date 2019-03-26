library(BETS)


### Name: dummy
### Title: Create a monthly or quarterly dummy
### Aliases: dummy

### ** Examples


#1 from a specific date to another specific date
dummy(start = c(2000,1),end = c(2012,5),frequency = 12,from = c(2005,1),to = c(2006,12))


#Other options that may be helpful:

#over a month equal to 1
dummy(start = c(2000,1), end = c(2012,5), frequency = 12, month = c(5,12))

#Months equal to 1 only for some year
dummy(start = c(2000,1), end = c(2012,5), frequency = 12, month = 5, year = 2010)
dummy(start = c(2000,1), end = c(2012,5), frequency = 12, month = 8, year = 2002)

#Months equal to 1 only for some years
dummy(start = c(2000,1), end = c(2012,5), frequency = 12, month = 5, year = 2005:2007)
dummy(start = c(2000,1), end = c(2012,5), frequency = 12, month = 3, year = c(2005,2007))
dummy(start = c(2000,1), end = c(2012,5), frequency = 12, month = 5:6, year = c(2005,2007))

#specific dates
dummy(start = c(2000,1), end = c(2012,5), frequency = 12, date = list(c(2010,1)))
dummy(start = c(2000,1), end = c(2012,5), 
    freq = 12, date = list(c(2010,9), c(2011,1), c(2000,1)) )





