library(rbtc)


### Name: intMinDay
### Title: Integer representation of a day-begin
### Aliases: intMinDay

### ** Examples

d1 <- "2017-03-15"
d1 <- intMinDay(d1)
d2 <- "2017-03-15 00:00:00"
d2 <- intMinDay(d2)
identical(d1,d2)



