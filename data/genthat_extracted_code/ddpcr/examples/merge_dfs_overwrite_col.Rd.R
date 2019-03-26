library(ddpcr)


### Name: merge_dfs_overwrite_col
### Title: Overwrite a column in a data.frame based on a matching column in
###   another df
### Aliases: merge_dfs_overwrite_col
### Keywords: internal

### ** Examples

df <- function(...) data.frame(..., stringsAsFactors = FALSE)

df1 <- df(a = 1:4, b = c("one", NA, "three", "four"))
df2 <- df(a = 1:4, b = c("ONE", "TWO", NA, "FOUR"))
merge_dfs_overwrite_col(df1, df2, "b", "a")
merge_dfs_overwrite_col(df2, df1, "b", "a")

df3 <- df(a = 1:3, b = c("one", NA, "three"))
df4 <- df(a = 2:4, b = c("TWO", NA, "FOUR"))
merge_dfs_overwrite_col(df3, df4, "b", "a")
merge_dfs_overwrite_col(df4, df3, "b", "a")

df5 <- df(a = 1:3, b = c("one", "two", "three"), c = letters[1:3])
df6 <- df(b = c("ONE", "TWO", "THREE"), c = LETTERS[1:3], a = 1:3)
merge_dfs_overwrite_col(df5, df6, "b", "a")
merge_dfs_overwrite_col(df6, df5, "b", "a")

df7 <- df(a = 1:3, b = c("one", "two", "three"))
df8 <- df(a = 1:4)
merge_dfs_overwrite_col(df7, df8, "b", "a")
merge_dfs_overwrite_col(df8, df7, "b", "a")

df9 <- df(a = 1:3, b = c("one", "two", "three"), c = 1:3)
df10 <- df(a = 1:3, b = c("ONE", NA, "THREE"), c = 4:6)
merge_dfs_overwrite_col(df9, df10, c("b", "c"), "a")
merge_dfs_overwrite_col(df10, df9, c("b", "c"), "a")



