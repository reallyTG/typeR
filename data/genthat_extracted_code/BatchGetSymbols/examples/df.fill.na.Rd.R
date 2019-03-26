library(BatchGetSymbols)


### Name: df.fill.na
### Title: Replaces NA values in dataframe for closest price
### Aliases: df.fill.na

### ** Examples


df <- data.frame(price.adjusted = c(NA, 10, 11, NA, 12, 12.5, NA ), volume = c(1,10, 0, 2, 0, 1, 5))

df.fixed.na <- df.fill.na(df)




