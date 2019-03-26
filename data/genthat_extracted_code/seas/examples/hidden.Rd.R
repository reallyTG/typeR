library(seas)


### Name: hidden
### Title: Return title and properties for seasonal graphs
### Aliases: hidden .seasxlab .seasylab .seastitle .seasmonthgrid
### Keywords: utilities

### ** Examples

setSeasOpts()

.seasxlab(11, 1)
.seasxlab("mon", 1)

# Not starting on January 1st
.seasxlab(11, 120)

# Labelled according to month (and possibly day)
getOption("seas.label")$month
.seasxlab("mon", as.Date("2000-08-01"))
getOption("seas.label")$monthday
.seasxlab(365/20, as.Date("2000-08-15"))



