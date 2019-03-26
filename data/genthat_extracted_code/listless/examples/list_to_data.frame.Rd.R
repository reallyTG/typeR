library(listless)


### Name: list_to_data.frame
### Title: Convert a list to a data frame
### Aliases: list_to_data.frame

### ** Examples

(l <- list(
  a = 1,
  2:3,                             # missing names are blank
  c = list(ca = 4:6, 7:10, list(cca = 11:15)),
  d = list()                       # empty elt's silently ignored
))
list_to_data.frame(l)

# Custom column names
list_to_data.frame(l, c("group", "subgroup", "element"), "amount")



