library(mondate)


### Name: cut.mondate
### Title: Convert a mondate Object to a Factor
### Aliases: cut cut.mondate
### Keywords: methods

### ** Examples

x <- mondate(0:12)
cut(x, breaks = 4)
cut(x, mondate.ymd(1999) + c(0, 3, 6, 9, 12)) # same as above

# days
x <- mondate.ymd(2013, 1, 1:7)
cut(x, breaks = "days")

# weeks
x <- mondate.ymd(2013, 1, 1:31)  # days in January 2013
cut(x, breaks = "weeks") # labeled by the first 5 Sundays of 2013
cut(x, breaks = "2 weeks") # labeled by 2nd, 4th, and 6th Sundays of 2013

# months
x <- mondate.ymd(2013, 1:12, 15) # 15th day of each month in 2013
cut(x, breaks = "months") # labeled by last day of the month
cut(x, breaks = "months", right = FALSE) # labeled by first day of the month
cut(x, breaks = "2 months") # labeled by last day of the month
x1 <- mondate.ymd(2008, 6)
x2 <- mondate.ymd(2008:2011, 6)
cx1 <- cut(x1, "month", right = FALSE)
cx2 <- cut(x2, "month", right = FALSE)
stopifnot(levels(cx1)[cx1] == levels(cx2)[cx2[1]])

# quarters
x <- mondate.ymd(2013, 1:12, 15) # 15th day of each month in 2013
cut(x, "quarters")       # labeled by last day of the quarter
cut(x, "quarters", right = FALSE) # labeled by first day of the quarter
cut(x, "2 quarters")
cut(x, "2 quarters", right = FALSE) # labeled by first day of the quarter

# years
m <- mondate(0:12)
cut(m, "years")           # labeled by last day of the year
cut(m, "years", right = FALSE) # labeled by last day of the year
displayFormat(m) <- "%Y"
cut(m, "years")           # labeled by just the year
x <- mondate.ymd(2008:2013, 6)
cut(x, "years")                  # 6 levels labeled by last day of the year
cut(x, "years", right = FALSE)   # 6 levels labeled by first day of the year
cut(x, "3 years")                # 2 levels
cut(x, "3 years", right = FALSE) # 2 levels
x1 <- mondate.ymd(2008, 12)
x2 <- mondate.ymd(2008:2011, 12)
cx1 <- cut(x1, "year", right = FALSE)
cx2 <- cut(x2, "year", right = FALSE)
stopifnot(levels(cx1)[cx1] == levels(cx2)[cx2[1]])



