library(jwutil)


### Name: merge_better
### Title: Merge better
### Aliases: merge_better mergeBetter

### ** Examples

df <- data.frame(a= c("1","2"), b = 1:2, stringsAsFactors = FALSE)
eg <- data.frame(a= c("1","3"), b = 3:4, stringsAsFactors = FALSE)
mergeBetter(x = df, y = eg, by.x = "a", by.y = "a", verbose = TRUE)



