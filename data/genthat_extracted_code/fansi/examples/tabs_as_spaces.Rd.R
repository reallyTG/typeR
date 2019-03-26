library(fansi)


### Name: tabs_as_spaces
### Title: Replace Tabs With Spaces
### Aliases: tabs_as_spaces

### ** Examples

string <- '1\t12\t123\t1234\t12345678'
tabs_as_spaces(string)
writeLines(
  c(
    '-------|-------|-------|-------|-------|',
    tabs_as_spaces(string)
) )
writeLines(
  c(
    '-|--|--|--|--|--|--|--|--|--|--|',
    tabs_as_spaces(string, tab.stops=c(2, 3))
) )
writeLines(
  c(
    '-|--|-------|-------|-------|',
    tabs_as_spaces(string, tab.stops=c(2, 3, 8))
) )



