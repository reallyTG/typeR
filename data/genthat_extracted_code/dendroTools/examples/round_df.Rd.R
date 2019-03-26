library(dendroTools)


### Name: round_df
### Title: round_df
### Aliases: round_df
### Keywords: internal

### ** Examples

ID <- c("a", "b", "c", "d", "e")
Value1 <- as.numeric(c("3.4", "6.4", "8.7", "1.1", "0.1"))
Value2 <- as.numeric(c("8.2", "1.7", "6.4", "1.9", "10.3"))
df <- data.frame(ID, Value1, Value2, stringsAsFactors = FALSE)
round_df(df, digits = 0)




