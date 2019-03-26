library(mondate)


### Name: as.list method
### Title: Construct a list from a mondate
### Aliases: as.list.mondate

### ** Examples

YE <- mondate.mdy(12, 31, 2011:2012)
sapply(YE, class)    # "mondate" "mondate"
sapply(YE, month)   # same as month(YE)
month(YE)



