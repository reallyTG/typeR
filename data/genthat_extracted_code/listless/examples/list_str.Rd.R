library(listless)


### Name: list_str
### Title: Summarise the structure of a list
### Aliases: list_str

### ** Examples

l <- list(
  a = 1,
  b = matrix(1:6, 2),
  c = list(
    ca = y ~ x,
    list(cba = median, cbb = quote(1 + 1), cbc = expression(1 + 1)),
    cc = list(cca = as.name("xyz"))
  ),
  d = array(1:24, 2:4)
)
list_str(l)



