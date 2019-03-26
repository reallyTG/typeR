library(epitools)


### Name: epidate
### Title: Convert dates into multiple legible formats
### Aliases: epidate
### Keywords: chron

### ** Examples

#x <- c("12/1/03", "11/2/03", NA, "1/7/04", "1/14/04", "8/18/04")
#epidate(x, format = "%m/%d/%y")
#epidate(x, format = "%m/%d/%y", TRUE)
#
###convert vector of disease weeks into vector of mid-week dates
#dwk <- sample(0:53, 100, replace = TRUE)
#wk2date <- paste(dwk, "/", "Wed", sep="")
#wk2date[1:10]
#wk2date2 <- epidate(wk2date, format = "%U/%a")
#wk2date2$dates[1:20]



