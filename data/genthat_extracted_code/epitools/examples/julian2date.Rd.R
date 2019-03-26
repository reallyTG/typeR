library(epitools)


### Name: julian2date
### Title: Convert a julian date into standard a date format
### Aliases: julian2date
### Keywords: chron

### ** Examples

mydates <- c("1/1/04", "1/2/04", "1/7/04", "1/14/04", "8/18/04");
mydates <- as.Date(mydates, format = "%m/%d/%y")
mydates
myjulian <- julian(mydates)
myjulian
julian2date(myjulian)




