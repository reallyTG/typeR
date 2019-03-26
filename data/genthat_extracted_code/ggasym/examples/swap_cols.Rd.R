library(ggasym)


### Name: swap_cols
### Title: Swap columns in a data frame
### Aliases: swap_cols

### ** Examples

df <- data.frame(a = c("A", "B"),
                 b = c("C", "D"),
                 untouched = c(1, 2))
df

swap_cols(df, a, b)




