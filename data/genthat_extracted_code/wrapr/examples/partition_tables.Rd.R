library(wrapr)


### Name: partition_tables
### Title: Partition as set of tables into a list.
### Aliases: partition_tables

### ** Examples


d1 <- data.frame(a = 1:5, g = c(1, 1, 2, 2, 2))
d2 <- data.frame(x = 1:3, g = 1:3)
d3 <- data.frame(y = 1)
partition_tables(c("d1", "d2", "d3"), "g", tables = list(d1 = d1, d2 = d2, d3 = d3))




