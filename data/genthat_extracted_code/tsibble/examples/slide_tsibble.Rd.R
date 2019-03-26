library(tsibble)


### Name: slide_tsibble
### Title: Perform sliding windows on a tsibble by row
### Aliases: slide_tsibble

### ** Examples

harvest <- tsibble(
  year = rep(2010:2012, 2),
  fruit = rep(c("kiwi", "cherry"), each = 3),
  kilo = sample(1:10, size = 6),
  key = id(fruit), index = year
)
harvest %>% 
  slide_tsibble(.size = 2)



