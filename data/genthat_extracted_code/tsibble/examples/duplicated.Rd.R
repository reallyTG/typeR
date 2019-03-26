library(tsibble)


### Name: is_duplicated
### Title: Test duplicated observations determined by key and index
###   variables
### Aliases: is_duplicated are_duplicated duplicates

### ** Examples

harvest <- tibble(
  year = c(2010, 2011, 2013, 2011, 2012, 2014, 2014),
  fruit = c(rep(c("kiwi", "cherry"), each = 3), "cherry"),
  kilo = sample(1:10, size = 7)
)
is_duplicated(harvest, key = id(fruit), index = year)
are_duplicated(harvest, key = id(fruit), index = year)
are_duplicated(harvest, key = id(fruit), index = year, from_last = TRUE)
duplicates(harvest, key = id(fruit), index = year)



