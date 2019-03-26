library(tsibble)


### Name: has_gaps
### Title: Does a tsibble have implicit gaps in time?
### Aliases: has_gaps

### ** Examples

harvest <- tsibble(
  year = c(2010, 2011, 2013, 2011, 2012, 2013),
  fruit = rep(c("kiwi", "cherry"), each = 3),
  kilo = sample(1:10, size = 6),
  key = id(fruit), index = year
)
has_gaps(harvest)
has_gaps(harvest, .full = TRUE)



