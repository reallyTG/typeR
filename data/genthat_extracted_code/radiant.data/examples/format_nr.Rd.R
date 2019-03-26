library(radiant.data)


### Name: format_nr
### Title: Format a number with a specified number of decimal places,
###   thousand sep, and a symbol
### Aliases: format_nr

### ** Examples

format_nr(2000, "$")
format_nr(2000, dec = 4)
format_nr(.05, perc = TRUE)
format_nr(c(.1, .99), perc = TRUE)
format_nr(data.frame(a = c(.1, .99)), perc = TRUE)
format_nr(data.frame(a = 1:10), sym = "$", dec = 0)
format_nr(c(1, 1.9, 1.008, 1.00))
format_nr(c(1, 1.9, 1.008, 1.00), drop0trailing = TRUE)
format_nr(NA)
format_nr(NULL)




