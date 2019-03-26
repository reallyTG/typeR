library(dplyr)


### Name: n
### Title: The number of observations in the current group.
### Aliases: n

### ** Examples

if (require("nycflights13")) {
carriers <- group_by(flights, carrier)
summarise(carriers, n())
mutate(carriers, n = n())
filter(carriers, n() < 100)
}



