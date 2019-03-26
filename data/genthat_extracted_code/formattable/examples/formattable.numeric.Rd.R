library(formattable)


### Name: formattable.numeric
### Title: Create a formattable numeric vector
### Aliases: formattable.numeric

### ** Examples

formattable(rnorm(10), format = "f", digits = 1)
formattable(rnorm(10), format = "f",
  flag="+", digits = 1)
formattable(1:10,
  postproc = function(str, x) paste0(str, "px"))
formattable(1:10,
  postproc = function(str, x)
    paste(str, ifelse(x <= 1, "unit", "units")))



