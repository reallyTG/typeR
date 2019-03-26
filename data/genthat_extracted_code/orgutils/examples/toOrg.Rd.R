library(orgutils)


### Name: toOrg
### Title: Generate Org-mode Markup
### Aliases: toOrg print.org toOrg.data.frame toOrg.Date toOrg.POSIXt

### ** Examples

toOrg(data.frame(a = 1:3, row.names = LETTERS[1:3]))
## =>  | row.names | a |
##     |-----------+---|
##     | A         | 1 |
##     | B         | 2 |
##     | C         | 3 |

toOrg(data.frame(a = 1:3))
## =>  | a |
##     |---|
##     | 1 |
##     | 2 |
##     | 3 |

toOrg(data.frame(a = 1:3), row.names = TRUE)
## =>  | row.names | a |
##     |-----------+---|
##     | 1         | 1 |
##     | 2         | 2 |
##     | 3         | 3 |


toOrg(data.frame(a = 1:5), row.names = "row numbers")
## =>  | row numbers | a |
##     |-------------+---|
##     | 1           | 1 |
##     | 2           | 2 |
##     | 3           | 3 |
##     | 4           | 4 |
##     | 5           | 5 |

## Not run: 
##D writeLines(toOrg(data.frame(a = 1:3)), "~/Desktop/my_table.org")
## End(Not run)

## Dates/Times
toOrg(as.Date("2015-01-01"))                   ## <2015-01-01 Thu>
toOrg(as.Date("2015-01-01"), inactive = TRUE)  ## [2015-01-01 Thu]
toOrg(Sys.time())                              ## <2017-03-20 Mon 13:23:18>

## Convert Org dates to Date

## see ?strptime: Each input string is processed as far as
##                necessary for the format specified: any
##                trailing characters are ignored.
d <- toOrg(as.Date("2015-01-01"))
as.Date(d, "<%Y-%m-%d")




