library(ggasym)


### Name: is_grouped
### Title: Is a data table grouped?
### Aliases: is_grouped

### ** Examples

df <- data.frame(x = c(1:5), g = c(1,1,2,2,2))
is_grouped(df)

is_grouped(dplyr::group_by(df, g))




