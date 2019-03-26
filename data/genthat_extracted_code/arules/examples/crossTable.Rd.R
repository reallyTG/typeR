library(arules)


### Name: crossTable
### Title: Cross-tabulate joint occurrences across pairs of items
### Aliases: crossTable crossTable,itemMatrix-method
### Keywords: models

### ** Examples

data("Groceries")

ct <- crossTable(Groceries, sort=TRUE)
ct[1:5, 1:5]

sp <- crossTable(Groceries, measure="support", sort=TRUE)
sp[1:5,1:5]

lift <- crossTable(Groceries, measure="lift", sort=TRUE)
lift[1:5,1:5]

chi2 <- crossTable(Groceries, measure="chiSquared", sort=TRUE)
chi2[1:5,1:5]




