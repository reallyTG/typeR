library(kutils)


### Name: mergeCheck
### Title: First draft of function to diagnose problems in merges and key
###   variables
### Aliases: mergeCheck

### ** Examples

df1 <- data.frame(id = 1:7, x = rnorm(7))
df2 <- data.frame(id = c(2:6, 9:10), x = rnorm(7))
mc1 <- mergeCheck(df1, df2, by = "id")
## Use mc1 objects mc1$keysBad, mc1$keysDuped, mc1$unmatched
df1 <- data.frame(id = c(1:3, NA, NaN, "", " "), x = rnorm(7))
df2 <- data.frame(id = c(2:6, 5:6), x = rnorm(7))
mergeCheck(df1, df2, by = "id")
df1 <- data.frame(idx = c(1:5, NA, NaN), x = rnorm(7))
df2 <- data.frame(idy = c(2:6, 9:10), x = rnorm(7))
mergeCheck(df1, df2, by.x = "idx", by.y = "idy")



