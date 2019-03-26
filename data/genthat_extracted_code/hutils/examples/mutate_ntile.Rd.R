library(hutils)


### Name: mutate_ntile
### Title: Add a column of ntiles to a data table
### Aliases: mutate_ntile

### ** Examples

library(data.table)
DT <- data.table(x = 1:20, y = 2:1)
mutate_ntile(DT, "x", n = 10)
mutate_ntile(DT, "x", n = 5)
mutate_ntile(DT, "x", n = 10, by = "y")
mutate_ntile(DT, "x", n = 10, keyby = "y")

y <- "x"
DT <- data.table(x = 1:20, y = 2:1)
mutate_ntile(DT, y, n = 5)                        # Use DT$y
mutate_ntile(DT, y, n = 5, character.only = TRUE) # Use DT$x




