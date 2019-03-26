library(sjstats)


### Name: table_values
### Title: Expected and relative table values
### Aliases: table_values

### ** Examples

tab <- table(sample(1:2, 30, TRUE), sample(1:3, 30, TRUE))
# show expected values
table_values(tab)$expected
# show cell percentages
table_values(tab)$cell




