library(datetime)


### Name: as.second
### Title: Interconvert Nominal Time Units
### Aliases: duration as.second as.minute as.hour as.day as.week as.month
###   as.year as.second.numeric as.minute.numeric as.hour.numeric
###   as.day.numeric as.week.numeric as.month.numeric as.year.numeric
###   format.duration print.duration as.second.minute as.minute.second
###   as.minute.hour as.hour.minute as.hour.day as.day.hour as.day.week
###   as.week.day as.day.month as.month.day as.day.year as.year.day
###   as.second.second as.minute.minute as.hour.hour as.day.day
###   as.week.week as.month.month as.year.year as.second.hour as.second.day
###   as.second.duration as.minute.duration as.hour.second as.hour.duration
###   as.day.duration as.week.duration as.month.duration as.year.duration
### Keywords: manip

### ** Examples

as.year(as.month(12))
as.year(as.day(365.25))
as.second(as.year(1))
as.month(2) + as.week(2)
as.week(2) + as.month(1)
as.month(2) - as.week(2)
as.week(2) - as.month(1)
as.week(2) + 1
as.week(2) - 1
2 + as.week(1)
2 - as.week(1)
class(c(as.day(1),as.day(2)))
class(as.day(1:5)[3])
class(as.day(1:5)[[3]])
class(seq(from=as.day(2),to=as.day(6)))
class(rep(as.day(1),5))



