library(dplyr)


### Name: group_size
### Title: Calculate group sizes.
### Aliases: group_size n_groups
### Keywords: internal

### ** Examples

if (require("nycflights13")) {

by_day <- flights %>% group_by(year, month, day)
n_groups(by_day)
group_size(by_day)

by_dest <- flights %>% group_by(dest)
n_groups(by_dest)
group_size(by_dest)
}



