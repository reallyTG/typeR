library(openair)


### Name: selectByDate
### Title: Subset a data frame based on date
### Aliases: selectByDate
### Keywords: methods

### ** Examples


## select all of 1999
data.1999 <- selectByDate(mydata, start = "1/1/1999", end = "31/12/1999")
head(data.1999)
tail(data.1999)

# or...
data.1999 <- selectByDate(mydata, start = "1999-01-01", end = "1999-12-31")

# easier way
data.1999 <- selectByDate(mydata, year = 1999)


# more complex use: select weekdays between the hours of 7 am to 7 pm
sub.data <- selectByDate(mydata, day = "weekday", hour = 7:19)

# select weekends between the hours of 7 am to 7 pm in winter (Dec, Jan, Feb)
sub.data <- selectByDate(mydata, day = "weekend", hour = 7:19, month =
c("dec", "jan", "feb"))




