library(bizdays)


### Name: offset
### Title: Offsets the given 'dates' by 'n' business days
### Aliases: offset add.bizdays

### ** Examples

create.calendar("Brazil/ANBIMA", holidaysANBIMA, weekdays=c("saturday", "sunday"),
                adjust.from=adjust.next, adjust.to=adjust.previous)
offset("2013-01-02", 5, "Brazil/ANBIMA")

# Once you have a default calendar set, cal does not need to be provided
bizdays.options$set(default.calendar="Brazil/ANBIMA")

dates <- seq(as.Date("2013-01-01"), as.Date("2013-01-05"), by="day")
is.bizday(dates)
offset(dates, 1)




