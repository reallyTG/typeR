library(epitools)


### Name: as.week
### Title: Convert dates object in 'disease week' for plotting epidemic
###   curves
### Aliases: as.week
### Keywords: chron

### ** Examples

dates <- c("1/1/04", "1/2/04", "1/3/04", "1/4/04", "1/5/04",
"1/6/04", "1/7/04", "1/8/04", "1/9/04", "1/10/04", NA, "1/12/04",
"1/14/04", "3/5/04", "5/5/04", "7/6/04", "8/18/04", "12/13/05",
"1/5/05", "4/6/05", "7/23/05", "10/3/05")
aw <- as.week(dates, format = "%m/%d/%y")
aw

aw2 <- as.week(dates, format = "%m/%d/%y", sunday= FALSE)
aw2

aw3 <- as.week(dates, format = "%m/%d/%y", min.date="2003-01-01")
aw3




