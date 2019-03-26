library(chron)


### Name: cut.dates
### Title: Create a Factor from a Chron or Dates Object
### Aliases: cut.dates
### Keywords: chron

### ** Examples

# days from 07/01/92 thru 07/15/92 fell into 3 Monday-started weeks
cut(dates("07/01/92") + 0:14, "weeks")
# [1] week 1 week 1 week 1 week 1 week 1 week 2 week 2 week 2 
# [9] week 2 week 2 week 2 week 2 week 3 week 3 week 3

dts <- dates(c("02/27/92", "02/27/92", "01/14/92",
               "02/28/92", "02/01/92"))
cut(dts, "months")
# [1] Feb 92 Feb 92 Jan 92 Feb 92 Feb 92
boxplot(runif(5) ~ cut(dts, "months"))



