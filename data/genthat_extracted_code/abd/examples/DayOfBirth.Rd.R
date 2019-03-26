library(abd)


### Name: DayOfBirth
### Title: Day of Birth
### Aliases: DayOfBirth
### Keywords: datasets

### ** Examples

DayOfBirth
barchart( day ~ births, DayOfBirth, origin=0)

# Fix bad ordering of days
DayOfBirth$oday <- with(DayOfBirth, ordered(day, levels = day))
barchart( oday ~ births, DayOfBirth, origin=0)
barchart( births ~ oday, DayOfBirth, horizontal = FALSE, origin=0)
barchart( births ~ oday, DayOfBirth, horizontal = FALSE, origin=0,
 scales = list(x=list(rot=45)))

barplot(DayOfBirth$births,
  ylim = c(0, 70),
  names.arg = DayOfBirth$day,
  las = 2,
  mgp = c(3, 0.75, 0))



