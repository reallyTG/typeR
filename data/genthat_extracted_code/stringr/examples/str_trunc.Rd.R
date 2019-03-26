library(stringr)


### Name: str_trunc
### Title: Truncate a character string.
### Aliases: str_trunc

### ** Examples

x <- "This string is moderately long"
rbind(
  str_trunc(x, 20, "right"),
  str_trunc(x, 20, "left"),
  str_trunc(x, 20, "center")
)




