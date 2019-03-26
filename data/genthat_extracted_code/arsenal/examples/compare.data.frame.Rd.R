library(arsenal)


### Name: compare.data.frame
### Title: Compare two data.frames and report differences
### Aliases: compare.data.frame print.compare.data.frame

### ** Examples


df1 <- data.frame(id = paste0("person", 1:3), a = c("a", "b", "c"),
                  b = c(1, 3, 4), c = c("f", "e", "d"),
                  row.names = paste0("rn", 1:3), stringsAsFactors = FALSE)
df2 <- data.frame(id = paste0("person", 3:1), a = c("c", "b", "a"),
                  b = c(1, 3, 4), d = paste0("rn", 1:3),
                  row.names = paste0("rn", c(1,3,2)), stringsAsFactors = FALSE)
summary(compare(df1, df2))
summary(compare(df1, df2, by = "id"))
summary(compare(df1, df2, by = "row.names"))



