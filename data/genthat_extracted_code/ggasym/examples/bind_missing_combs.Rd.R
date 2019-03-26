library(ggasym)


### Name: bind_missing_combs
### Title: Add the missing combinations of x and y
### Aliases: bind_missing_combs

### ** Examples

df <- data.frame(a = c("A", "B"),
                 b = c("C", "A"),
                 untouched = c(1, 2),
                 stringsAsFactors = FALSE)
df

bind_missing_combs(df, a, b)




