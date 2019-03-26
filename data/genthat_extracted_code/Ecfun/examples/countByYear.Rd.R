library(Ecfun)


### Name: countByYear
### Title: Allocate a total by year
### Aliases: countByYear
### Keywords: manip

### ** Examples

##
## 1.  All in one year
##
start73 <- as.Date('1973-01-22')
tst1 <- countByYear(start73, start73+99, 123)

# check 
tst1. <- 123
names(tst1.) <- 1973
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst1, tst1.)
## Don't show: 
)
## End(Don't show)

##
## 2.  Two years 
##
tst2 <- countByYear(start73, start73+365, 123) 

# check 
dur <- 366
days1 <- (365-21)
days2 <- 22
tst2. <- 123 * c(days1, days2)/dur 
names(tst2.) <- 1973:1974 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst2, tst2.)
## Don't show: 
)
## End(Don't show)

##
## 3.  Ten years 
## 
tst10 <- countByYear(start73, start73+10*365.2, 123)

# check 
days <- (c(rep(c(rep(365, 3), 366), length=10), 0)
         + c(-21, rep(0, 9), 22) )
tst10. <- 123 * days/(10*365.2+1) 
names(tst10.) <- 1973:1983 

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst10, tst10.)
## Don't show: 
)
## End(Don't show)
          



