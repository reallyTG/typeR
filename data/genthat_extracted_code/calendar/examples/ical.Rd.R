library(calendar)


### Name: ical
### Title: Create object of class ical
### Aliases: ical

### ** Examples

# ical from .ics characters:
class(ical_example)
ic <- ical(ical_example)
attributes(ic)
class(ic)
# ical from data frame:
ic_df <- data.frame(ic)
ic2 <- ical(ic_df)
class(ic2)
attributes(ic2)



