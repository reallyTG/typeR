library(hutils)


### Name: select_grep
### Title: Select names matching a pattern
### Aliases: select_grep

### ** Examples

library(data.table)
dt <- data.table(x1 = 1, x2 = 2, y = 0)
select_grep(dt, "x")
select_grep(dt, "x", .and = "y")
select_grep(dt, "x", .and = "y", .but.not = "x2")




