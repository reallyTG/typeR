library(forcats)


### Name: fct_shift
### Title: Shift factor levels to left or right, wrapping around at end
### Aliases: fct_shift

### ** Examples

x <- factor(
  c("Mon", "Tue", "Wed"),
  levels = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),
  ordered = TRUE
)
x
fct_shift(x)
fct_shift(x, 2)
fct_shift(x, -1)



