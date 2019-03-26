library(tsibble)


### Name: stretch_tsibble
### Title: Perform stretching windows on a tsibble by row
### Aliases: stretch_tsibble

### ** Examples

harvest <- tsibble(
  year = rep(2010:2012, 2),
  fruit = rep(c("kiwi", "cherry"), each = 3),
  kilo = sample(1:10, size = 6),
  key = id(fruit), index = year
)
harvest %>%
  stretch_tsibble()



