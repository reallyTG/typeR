library(raustats)


### Name: abs_search
### Title: Search dataset information from the ABS.Stat API
### Aliases: abs_search

### ** Examples

 ## ABS dataset search
 x <- abs_search(pattern = "consumer price index")
 x <- abs_search(pattern = "census")
 x <- abs_search(pattern = "labour force")

 ## ABS indicator search
 x <- abs_search(pattern = "all groups", dataset="CPI")
 x <- abs_search(pattern = c("all groups", "capital cities"), dataset="CPI")




