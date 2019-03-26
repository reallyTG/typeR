library(rbtc)


### Name: intMaxDay
### Title: Integer representation of a day-end
### Aliases: intMaxDay

### ** Examples

d1 <- "2017-03-15"
d1 <- intMaxDay(d1)
d2 <- "2017-03-15 23:59:59"
d2 <- intMaxDay(d2)
identical(d1,d2)



