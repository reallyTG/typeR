library(ggasym)


### Name: add_missing_combinations
### Title: Add missing combinations of x and y to a data frame
### Aliases: add_missing_combinations

### ** Examples

df <- data.frame(a = c("A", "B"),
                 b = c("C", "D"),
                 untouched = c(1, 2))
df

add_missing_combinations(df, a, b)




