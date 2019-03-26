library(questionr)


### Name: na.rm
### Title: Remove observations with missing values
### Aliases: na.rm

### ** Examples

df <- data.frame(x = c(1, 2, 3), y = c(0, 10, NA), z= c("a",NA,"b"))
df
na.omit(df)
na.rm(df)
na.rm(df, c("x","y"))
na.rm(df, "z")



