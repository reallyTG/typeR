library(ceterisParibus)


### Name: select_neighbours
### Title: Select Subset of Rows Closest to a Specified Observation
### Aliases: select_neighbours

### ** Examples

library("DALEX")

new_apartment <- apartments[1, 2:6]
small_apartments <- select_neighbours(apartmentsTest, new_apartment, n = 10)
new_apartment
small_apartments



