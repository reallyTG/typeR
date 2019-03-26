library(LilRhino)


### Name: Table_percent
### Title: Table Percent
### Aliases: Table_percent

### ** Examples


true <- rep(1:10, 10)
test <- rep(1:10, 10)
test[c(2, 22, 33, 89)] = 1
Table_percent(table(true, test))



