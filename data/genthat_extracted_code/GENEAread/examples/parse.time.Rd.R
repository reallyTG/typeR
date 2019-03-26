library(GENEAread)


### Name: parse.time
### Title: Parses a character time representation to another format.
### Aliases: parse.time

### ** Examples

t1 = parse.time("2012-06-21 13:04:01"); print(t1)
parse.time("21/06/12 13:04:01") #gives the same result

parse.time(c("19/07/70", "20/07/70"), format = "days")
#results here will depend on your locale
parse.time(c("19/07/70", "20/07/70"), format = "POSIX", tzone = -4)

#one is the same day, one can only find a match the next day
 parse.time("13:05", start = t1) - t1
 parse.time("13:00", start = t1) - t1
 #asking to wait 1 midnight means both times are considered as
 #times on the same, full day of data
 parse.time(c("1 13:05", "1 13:00"), start = t1) - t1
 #2012-06-21 is a Thursday, so this is equivalent
 parse.time(c("Fri 13:05", "Fri 13:00"), start = t1) - t1
 #Longer form days of the week are also understood. Note that
 #the first day does not get matched.
 parse.time(c("Thursday 13:05", "Thursday 13:00"), start = t1) - t1




