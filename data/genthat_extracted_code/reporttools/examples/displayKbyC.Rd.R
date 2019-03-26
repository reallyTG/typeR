library(reporttools)


### Name: displayKbyC
### Title: Function to display a K x C frequency table including col- and
###   row-names and totals
### Aliases: displayKbyC
### Keywords: manip character

### ** Examples

set.seed(1977)
v1 <- round(runif(20, 0, 3))
v2 <- round(runif(20, 0, 5))
displayKbyC(v1, v2, percentage = "row", names = c("v1", "v2"), 
    cap = "", lab = "", row.nam = NA, col.nam = NA) 



