library(hutils)


### Name: select_which
### Title: Select columns satisfying a condition
### Aliases: select_which

### ** Examples

library(data.table)
DT <- data.table(x = 1:5,
                 y = letters[1:5],
                 AB = c(NA, TRUE, FALSE))
select_which(DT, anyNA, .and.dots = "y")



