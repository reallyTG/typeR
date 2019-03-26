library(hutils)


### Name: weight2rows
### Title: Expand a weighted data frame to an equivalent unweighted
### Aliases: weight2rows

### ** Examples


library(data.table)
DT <- data.table(x = 1:5, y = c(1, 1, 1, 1, 2))
weight2rows(DT, "y")
weight2rows(DT, "y", rows.out = 5)




